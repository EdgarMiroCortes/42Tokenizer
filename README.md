# Tokenizer — fortytwoken42

Proyecto **42 Tokenizer** (partenariado 42 × BNB Chain): creación, despliegue y documentación de un token propio en blockchain de prueba.

## Estado (sesión actual)

El token **está desplegado** en BSC Testnet y **importado** en MetaMask.

**Siguiente sesión:**

1. `transfer` on-chain de 1 TWOKEN a una segunda cuenta de MetaMask
2. Comprobar la tx en BscScan
3. Ensayar el guion de defensa (10–15 min)
4. (Opcional) verificar el código fuente en BscScan — no es obligatorio
5. Bonus multisig: **no** hasta que lo anterior esté sólido

## Decisiones de diseño

| Decisión | Elección | Motivo |
|----------|----------|--------|
| Blockchain | **BNB Smart Chain Testnet** | Partnership del subject con BNB; testnet = sin dinero real |
| Estándar | **BEP-20** | Estándar de tokens en BSC (equivalente práctico a ERC-20) |
| Herramientas | **Remix** | IDE en el navegador; suficiente para compile, prueba en VM y deploy |
| Nombre del token | **fortytwoken42** | Debe contener `42` (requisito del subject) |
| Ticker (símbolo) | **TWOKEN** | Identificador corto; 6 letras es válido en BEP-20 |
| Supply | **1_000_000** (fijo al deploy) | El subject no fija cantidad; supply fijo = fácil de explicar |
| Decimals | **18** | Convención habitual en BEP-20/ERC-20 |
| Ownership / privilegios | **Sin `Ownable`**: no hay mint, pause ni admin tras el deploy | Menos superficie de ataque; el deployer solo recibe el supply inicial |

## Despliegue

| Campo | Valor |
|-------|-------|
| Red | BNB Smart Chain Testnet |
| Chain ID | **97** |
| Dirección del contrato | `0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF` |
| Explorer | https://testnet.bscscan.com/address/0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF |
| Ticker | **TWOKEN** |
| Deployer | Wallet MetaMask que firmó el Deploy (tiene el supply inicial) |

## Estructura del repositorio

```
.
├── README.md           # Este archivo: decisiones y resumen
├── code/               # Código fuente del token (smart contract)
├── deployment/         # Configuración, address y pasos de despliegue
└── documentation/      # Documentación de uso y funcionamiento
```

## Cómo empezar (si estás perdido)

1. Leer **`documentation/00-guia-desde-cero.md`** (mapa completo, vocabulario y pasos)
2. Comparativa de estándar: `code/BEP20-vs-ERC20.md`
3. Contrato: `code/Fortytwoken42.sol`
4. Deploy ya hecho — datos en este README y en `deployment/`
5. Uso y demo: `documentation/02-how-to-use.md`
6. Ownership: `documentation/03-security.md`

## Seguridad

- Solo **testnet** (sin dinero real). Chain ID **97**, nunca BSC mainnet (**56**).
- Tras el deploy **nadie** puede mintear más tokens ni pausar el contrato.
- En la defensa: explicar que no hay rol admin on-chain; el riesgo es la wallet que guarda el supply.

## Bonus (opcional)

- Multisig: **no implementado**. Solo se evalúa si la parte obligatoria está completa y funciona.
- Detalles en `documentation/04-bonus-multisig.md`.
