# ITPCARGO - Frontend

Aplicacion web frontend para la plataforma de gestion de carga ITPCARGO (Innovatech Chile).

## Tecnologias

| Tecnologia | Version | Uso |
|---|---|---|
| React | 18.2 | UI componentes |
| Vite | 5.2 | Build tool + dev server |
| React Router DOM | 6.24 | Enrutamiento SPA |
| React Hook Form | 7.52 | Manejo de formularios |
| Axios | 1.6 | Cliente HTTP para APIs |
| SweetAlert2 | 11.11 | Alertas y confirmaciones |
| Tailwind CSS | 3.4 | Estilos utility-first |

## Estructura del Proyecto

```
front_despacho/
├── src/
│   ├── componentes/
│   │   ├── CrudAdmin/           ← CRUD de Ventas y Despachos
│   │   │   ├── TableCompras.jsx        ← Tabla de ventas (GET /api/v1/ventas)
│   │   │   ├── TableDespachos.jsx      ← Tabla de despachos (GET /api/v1/despachos)
│   │   │   ├── FormDespacho.jsx        ← Formulario crear/actualizar despachos
│   │   │   ├── FormCierreDespacho.jsx  ← Formulario cerrar despachos
│   │   │   ├── CardComponent.jsx       ← Tarjetas de resumen
│   │   │   ├── SearchBar.jsx           ← Barra de busqueda
│   │   │   └── Modal.jsx               ← Componente modal reutilizable
│   │   └── Layouts/            ← Contenedores de layout
│   ├── Routes/
│   │   └── AppRoutes.jsx       ← Configuracion de rutas (/)
│   ├── main.jsx                ← Punto de entrada
│   └── index.css               ← Estilos globales + Tailwind
├── public/                     ← Assets estaticos
├── index.html                  ← HTML raiz
├── vite.config.js              ← Configuracion Vite + proxy API
├── tailwind.config.js          ← Configuracion Tailwind
├── postcss.config.js           ← Configuracion PostCSS
└── db.json                     ← Base de datos simulada (desarrollo)
```

## Ejecucion Local

```powershell
# Instalar dependencias
npm install

# Servidor de desarrollo (http://localhost:5173)
npm run dev

# Build de produccion
npm run build
```

## Integracion con Backend

El frontend consume dos microservicios del backend:

| API | Endpoint | Metodo | Componente |
|---|---|---|---|
| Ventas | `/api/v1/ventas` | GET | `TableCompras.jsx` |
| Ventas | `/api/v1/ventas/{id}` | PUT | `FormDespacho.jsx` |
| Despacho | `/api/v1/despachos` | GET | `TableDespachos.jsx` |
| Despacho | `/api/v1/despachos` | POST | `FormDespacho.jsx` |
| Despacho | `/api/v1/despachos/{id}` | PUT | `FormCierreDespacho.jsx` |

> **Nota:** Actualmente las URLs del backend estan hardcodeadas en los componentes (IPs `192.168.x.x`). En Fase 2 se migraran a variables de entorno (`import.meta.env.VITE_API_URL`) para configurar dinamicamente segun el entorno (desarrollo local / AWS).

## Rutas

| Ruta | Componente | Descripcion |
|---|---|---|
| `/` | `CrudAdmin` | Vista principal con tablas y formularios |

### Componentes del CRUD

- **TableCompras** — Lista todas las ventas con opciones de ver, editar y eliminar
- **TableDespachos** — Lista todos los despachos con su estado
- **FormDespacho** — Crea nuevos despachos y actualiza ventas existentes
- **FormCierreDespacho** — Cierra despachos completados
- **CardComponent** — Tarjetas con resumen de KPIs
- **SearchBar** — Filtrado de registros en tablas

## Stack DevOps

Este frontend se despliega via:
- **Docker** — Imagen multi-stage con Nginx (Fase 2)
- **GitHub Actions** — Build automatico y push a ECR (Fase 3)
- **AWS EC2** — Servido en instancia publica con Nginx (Fase 4)

---
Evaluacion Parcial N°2 — Despliegue de Microservicios en AWS.
