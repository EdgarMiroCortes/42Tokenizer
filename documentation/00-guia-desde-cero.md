# Guía completa — desde cero (BEP-20)

Si no sabes nada de blockchain, empieza **aquí** y sigue el orden.
Decisión del proyecto: **BEP-20 en BNB Smart Chain Testnet**.

---

## Mapa mental en una frase

Vas a crear una **moneda digital de juguete** (token), subirla a una **red de prueba** (como un videojuego de blockchain), y demostrar que se puede **enviar y recibir**. Todo sin dinero real.

```
Idea del token  →  Contrato (reglas)  →  Deploy (subirlo a la red)
      →  Explorer (página pública)  →  Demo (enviar tokens)  →  Docs/README
```

---

## Vocabulario mínimo (léelo una vez)

| Palabra | Qué es | Analogía |
|---------|--------|----------|
| **Blockchain** | Libro contable compartido e inmutable | Un Excel público que nadie puede borrar |
| **BNB Smart Chain (BSC)** | Una blockchain concreta (familia BNB) | “El servidor” donde vive tu token |
| **Testnet** | Copia de prueba de esa red | Servidor de pruebas, no producción |
| **Mainnet** | Red real con dinero de verdad | **No la uses en este proyecto** |
| **Wallet (MetaMask)** | Tu cuenta + llaves | App bancaria + contraseña maestra |
| **Address** | Tu identidad pública (`0x…`) | Número de cuenta IBAN |
| **Clave privada / seed** | Secreto que controla la wallet | **Nunca se sube al repo ni se comparte** |
| **Gas / fee** | Comisión por cada acción en la red | Sello del correo |
| **tBNB** | “Dinero de mentira” para pagar gas en testnet | Fichas del arcade |
| **Faucet** | Web que te regala tBNB | Máquina de fichas gratis |
| **Smart contract** | Programa que vive en la blockchain | Máquina expendedora con reglas fijas |
| **Token** | Activo digital que gestiona ese contrato | Fichas que la máquina emite |
| **BEP-20** | Reglas estándar de cómo debe comportarse un token en BSC | “Todos los tokens hablan el mismo idioma” |
| **Deploy** | Publicar el contrato en la red | Subir la app al servidor |
| **Explorer (BscScan)** | Web para ver transacciones y contratos | Google de la blockchain |
| **Ticker** | Símbolo corto del token (ej. `TK42`) | Como EUR, USD… |
| **Owner** | Quién tiene privilegios especiales en el contrato | Admin |
| **Transfer** | Enviar tokens de A a B | Bizum de tokens |

---

# PARTE A — Entender el flujo (antes de tocar nada)

## Fragmento A1 — ¿Qué estás construyendo?

**Objetivo:** saber qué es el “producto” final.

Al acabar el proyecto tendrás:

1. Un **contrato** en `code/` (las reglas del token)
2. Ese contrato **desplegado** en BSC Testnet (existe de verdad en una red pública de prueba)
3. Una **dirección** `0x…` que cualquiera puede mirar en BscScan
4. Carpetas `deployment/` y `documentation/` + `README.md` explicando decisiones y uso
5. Capacidad de **demostrar**: “miro balance → envío tokens → se actualiza”

**No es:** una app móvil, un exchange, ni ganar dinero. Es un token de aprendizaje.

---

## Fragmento A2 — Por qué BEP-20 (y no ERC-20)

**Objetivo:** poder justificar la elección en el README y en la defensa.

| Motivo | Explicación |
|--------|-------------|
| Subject | El PDF es partnership **42 × BNB Chain** |
| Mismo “idioma” que ERC-20 | Aprendes el estándar universal de tokens |
| Testnet cómoda | Faucet de tBNB, fees bajas, demo fácil |
| Explorer | BscScan Testnet para enseñar el contrato |

**Decisión fija de este repo:** BEP-20 + BSC Testnet.

Detalle técnico: [code/BEP20-vs-ERC20.md](../code/BEP20-vs-ERC20.md)

---

## Fragmento A3 — Los 3 actores del flujo

**Objetivo:** visualizar quién hace qué.

```
┌─────────────┐     deploy / transfer      ┌──────────────────┐
│  Tú         │ ─────────────────────────► │  BSC Testnet     │
│  (MetaMask) │                            │  (red de prueba) │
└─────────────┘                            └────────┬─────────┘
       │                                            │
       │  miras resultados                          │ guarda
       ▼                                            ▼
┌─────────────┐                            ┌──────────────────┐
│  BscScan    │ ◄──── lee la red ───────── │ Smart contract   │
│  (explorer) │                            │ (tu token)       │
└─────────────┘                            └──────────────────┘
```

- **Tú:** firmas acciones con MetaMask (deploy, transfer).
- **Red:** ejecuta y guarda el resultado.
- **Explorer:** te deja enseñarlo en la evaluación.

---

# PARTE B — Flujo práctico paso a paso

Cada paso tiene: **objetivo**, **qué haces**, **cuándo está hecho**, **tiempo**.

---

## Paso 0 — Setup de identidad (wallet + red)

**Objetivo:** tener una “cuenta bancaria” de prueba en BSC Testnet.

| Qué haces | Detalle |
|-----------|---------|
| Instalar MetaMask | Extensión del navegador |
| Crear wallet | Guarda la seed phrase en un sitio seguro (papel/gestor). **Nunca en Git** |
| Añadir BSC Testnet | Red de prueba (no mainnet) |
| Pedir tBNB | Faucet oficial / el del subject |

**Hecho cuando:** en MetaMask ves red “BSC Testnet” (o similar) y un poco de tBNB.

**Tiempo:** 1–2 h (a veces el faucet es lo más lento).

**Por qué importa:** sin tBNB no puedes pagar gas → no puedes deploy ni transferir.

---

## Paso 1 — Diseñar el token (en papel)

**Objetivo:** decidir las reglas **antes** de programar.

Rellena esto (luego irá al README):

| Campo | Ejemplo | Tu valor |
|-------|---------|----------|
| Nombre (con **42**) | `Campus42Token` | |
| Ticker | `C42` | |
| Decimals | `18` (lo habitual) | |
| Supply inicial | `1_000_000` | |
| ¿Mint después? | No (más simple) o Solo owner | |
| ¿Quién es owner? | Tu address de MetaMask | |

**Recomendación si estás perdido:** supply fijo al deploy, sin mint complicado. Más fácil de explicar.

**Hecho cuando:** tienes nombre + ticker + supply + idea de privilegios.

**Tiempo:** 1 h.

---

## Paso 2 — Escribir el contrato (`code/`)

**Objetivo:** definir en código las reglas BEP-20 del token.

**Qué es realmente:** un archivo Solidity que dice:
- cómo se llama el token
- cuántos hay
- cómo se transfieren
- quién puede hacer cosas especiales (si las hay)

**Herramienta recomendada si no sabes nada:** **Remix** (IDE en el navegador). Más adelante Hardhat si quieres más “pro”.

**Hecho cuando:**
- el contrato compila sin errores
- en Remix (o tests) puedes: ver balance, transferir entre cuentas de prueba

**Tiempo:** 3–6 h (primera vez; incluye pelearse con errores).

**Va a la carpeta:** `code/`

---

## Paso 3 — Entender las acciones mínimas (sin deploy aún)

**Objetivo:** saber qué demostrarás en la evaluación.

| Acción | Objetivo | Qué verás |
|--------|----------|-----------|
| `balanceOf` | ¿Cuántos tokens tiene X? | Un número |
| `transfer` | Enviar de A → B | Balances cambian |
| `approve` + `transferFrom` | Autorizar a otro a mover tus tokens | (opcional pero muy BEP-20) |
| Owner | Quién administra | Solo el owner puede mint/pause si existen |

**Flujo de demo típico:**

```
Wallet A (tú, owner)  --transfer-->  Wallet B (segunda cuenta)
       │                                    │
       └──────── balances en MetaMask / BscScan ────────┘
```

**Truco:** crea **2 cuentas** en MetaMask (o usa otra wallet) para poder enviarte tokens a ti mismo entre addresses.

**Tiempo:** 1–2 h de práctica en Remix.

---

## Paso 4 — Deploy en BSC Testnet (`deployment/`)

**Objetivo:** que el token **exista** en una red pública de prueba.

**Flujo:**

```
1. MetaMask en BSC Testnet + tBNB
2. Desde Remix/Hardhat → Deploy
3. Confirmas la tx en MetaMask (pagas gas con tBNB)
4. La red te devuelve una address del contrato: 0xABC…
5. Copias esa address al README
```

**Hecho cuando:** tienes una address de contrato y la tx de creación aparece en BscScan Testnet.

**Tiempo:** 1–3 h.

**Va a la carpeta:** `deployment/` (scripts, pasos, config; **sin** claves privadas).

---

## Paso 5 — Explorer + ticker

**Objetivo:** que el evaluador pueda abrir un enlace y ver tu token.

| Qué | Para qué |
|-----|----------|
| Abrir contrato en BscScan Testnet | Transparencia |
| Verificar código (si puedes) | Code review más fácil |
| Definir ticker | Identidad del token |
| Anotar red + address en el repo | Requisito del subject |

**Hecho cuando:** el `README.md` raíz tiene red, address, ticker y enlace al explorer.

**Tiempo:** 1–2 h.

---

## Paso 6 — Documentación (`documentation/`)

**Objetivo:** que alguien que no eres tú entienda el proyecto.

| Archivo | Objetivo |
|---------|----------|
| `01-overview.md` | Qué es y qué representa |
| `02-how-to-use.md` | Cómo usarlo / demo |
| `03-security.md` | Owner y privilegios |
| `04-bonus-multisig.md` | Solo si haces bonus |

**Hecho cuando:** puedes darle la carpeta a un compañero y entiende sin que se lo expliques en persona.

**Tiempo:** 3–5 h (si vas apuntando durante el camino, mucho menos).

---

## Paso 7 — README de decisiones

**Objetivo:** explicar **porqués**, no solo hechos.

Debe quedar claro:
- por qué BEP-20 / BSC Testnet
- por qué Remix (o Hardhat)
- por qué ese supply / ownership
- dónde está el contrato (address + red)

**Tiempo:** 1–2 h.

---

## Paso 8 — Ensayo de defensa

**Objetivo:** no quedarte en blanco el día de la evaluación.

Guion sugerido (10–15 min):

1. “Elegí BEP-20 en BSC Testnet porque…”
2. Abro BscScan → enseño el contrato
3. Muestro balance en MetaMask
4. Hago un `transfer` en vivo
5. Explico quién es owner y qué puede hacer
6. Señalo `code/`, `deployment/`, `documentation/`

**Tiempo:** 1–2 h de ensayo.

---

# PARTE C — Flujos concretos dibujados

## Flujo C1 — “Crear el token” (una sola vez)

```
Diseño (nombre/ticker/supply)
        ↓
Escribir contrato en code/
        ↓
Probar en Remix (cuentas fake)
        ↓
Deploy a BSC Testnet (pagas tBNB)
        ↓
Guardar address + link BscScan
        ↓
Actualizar README + documentation
```

**Objetivo global:** el token existe on-chain y está documentado.

---

## Flujo C2 — “Usar el token” (cada demo)

```
Abrir MetaMask (BSC Testnet)
        ↓
(Si hace falta) Importar token con la address del contrato
        ↓
Elegir destinatario (otra address)
        ↓
Transfer → firmar en MetaMask → esperar confirmación
        ↓
Comprobar balances + tx en BscScan
```

**Objetivo global:** demostrar que el BEP-20 funciona de verdad.

---

## Flujo C3 — “Qué ve el evaluador”

```
Repo Git
  ├── Estructura correcta (code / deployment / documentation / README)
  ├── Código legible y comentado
  ├── Address + red escritas
  └── Docs claras
        +
Demo en vivo (transfer + explicación de ownership)
```

---

# PARTE D — Orden de trabajo recomendado (checklist)

Marca conforme avances:

### Semana / bloque 1 — Fundamentos
- [x] Leer este documento entero
- [x] Leer `code/BEP20-vs-ERC20.md`
- [x] Instalar MetaMask + BSC Testnet + faucet tBNB
- [x] Decidir nombre (con 42), ticker, supply

### Bloque 2 — Contrato
- [x] Escribir/compilar contrato en Remix
- [x] Probar transfer entre 2 cuentas (Remix VM)
- [x] Guardar código en `code/`
- [x] Apuntar decisiones de ownership en `documentation/03-security.md`

### Bloque 3 — Mundo real (testnet)
- [x] Deploy en BSC Testnet (`0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF`)
- [x] Guardar pasos en `deployment/`
- [x] Abrir en BscScan y anotar address en README
- [ ] Importar token en MetaMask (**hecho**) y transferir on-chain (**siguiente sesión**)

### Bloque 4 — Entrega
- [x] Completar `documentation/01` y `02`
- [x] Completar README (sin `[TODO]` críticos)
- [ ] Ensayar el guion de defensa
- [x] (Opcional) Bonus multisig: no implementado a propósito

---

# PARTE E — Errores típicos (para no volverte loco)

| Problema | Causa habitual | Qué mirar |
|----------|----------------|-----------|
| No puedo deploy | Sin tBNB / red incorrecta | MetaMask: ¿Testnet? ¿Saldo? |
| “Token no aparece” | No importado | Importar por address del contrato |
| Transfer falla | Sin gas / red mal | tBNB + BSC Testnet |
| Subí un secreto al Git | `.env` o clave privada | Bórralo, rota la key, crea wallet nueva si hace falta |
| Me pierdo con Hardhat | Demasiada herramienta al inicio | Empieza con **Remix** |

---

# PARTE F — Tiempo total orientativo

| Bloque | Horas si partes de cero |
|--------|-------------------------|
| Vocabulario + setup | 2–4 |
| Diseño + contrato + pruebas | 5–10 |
| Deploy + explorer | 2–4 |
| Docs + README + ensayo | 4–7 |
| **Total mandatory** | **~15–25 h** |

---

## Siguiente acción concreta (hoy)

No intentes hacerlo todo. Haz solo esto:

1. Instalar MetaMask  
2. Añadir **BSC Testnet**  
3. Conseguir **tBNB** del faucet  
4. Elegir **nombre con 42** + **ticker** y escribirlos en el README  

Cuando eso esté, el siguiente fragmento es abrir Remix y el contrato. Si quieres, en el siguiente mensaje te guío **solo el Paso 0** (MetaMask + red + faucet) clic a clic, sin código.
