# 03 — Seguridad y privilegios

El subject pide pensar ownership y privilegios. Este es el modelo **real** de `Fortytwoken42`.

## Modelo de ownership

El contrato **no** usa `Ownable`. No hay `onlyOwner`, ni mint posterior, ni pause, ni cambio de admin.

| Rol | Quién | Qué puede hacer |
|-----|-------|-----------------|
| Deployer (wallet) | La MetaMask que firmó el Deploy | Recibe el supply inicial (`1_000_000 TWOKEN`). Después es un holder más: puede `transfer` / `approve` como cualquiera. **No** puede crear más tokens ni pausar el contrato. |
| Holder | Cualquier address con saldo | Transferir sus propios tokens; `approve` a un spender |
| Spender (si hay `approve`) | Address autorizada | `transferFrom` hasta el allowance |
| Usuario sin tokens | Cualquier address | Llamar vistas (`balanceOf`, `name`…); no mueve fondos ajenos |

“Owner” en la defensa: **no hay owner on-chain**. El único “privilegio” es **tener tokens** (sobre todo el millón inicial). Perder la seed de esa wallet es perder el supply, no “controlar el contrato”.

## Riesgos considerados

- **Clave / seed del deployer:** quien la tenga mueve el millón inicial. No hay backdoor en el contrato para recuperarlos.
- **Mint ilimitado:** no aplica. `_mint` solo corre en el constructor.
- **Phishing de address:** hay que usar siempre `0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF` (BscScan Testnet). Otra address puede ser un token falso con el mismo nombre.
- **Mainnet por error:** Chain ID 56 gasta BNB real. Este proyecto solo usa **97**.
- **`approve` infinito:** riesgo clásico ERC-20 si se aprueba un spender malicioso; en la demo no hace falta `approve`.
- **Código no verificado en el explorer:** el bytecode está on-chain; verificar fuente es opcional y ayuda al code review visual.

## Buenas prácticas aplicadas

- Solo testnet para desarrollo y demo
- No hay claves privadas ni `.env` en el repo (firma con MetaMask)
- Estándar OpenZeppelin ERC-20 (batalla-probado) en lugar de escribir `transfer` a mano
- Supply fijo: no se puede inflar después
- Sin funciones privilegiadas que un evaluador pueda atacar (“¿y si el owner mintea?”)
- Nombres claros (`Fortytwoken42`, `TWOKEN`) para el review

## Durante la evaluación

Debes poder explicar:

1. Quién controla el contrato → **nadie con rol admin**; el código no tiene owner
2. Qué puede hacer el deployer que un usuario normal no puede → **nada a nivel de contrato**; solo partió con más saldo
3. Por qué es razonable → token de aprendizaje: menos privilegios = menos fallos de seguridad y una historia fácil de defender
