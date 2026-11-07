# 02 — Cómo usar el token

## Requisitos

1. Wallet compatible (MetaMask)
2. Red **BNB Smart Chain Testnet** (Chain ID **97**), no mainnet 56
3. tBNB del faucet para pagar gas (solo hace falta para enviar, no para ver saldo)
4. Dirección del contrato: `0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF`

## Añadir el token a la wallet

1. MetaMask → red **BNB Smart Chain Testnet**
2. Tokens → **Import tokens** → pestaña custom
3. Address: `0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF`
4. Symbol `TWOKEN`, decimals `18`
5. Importar y comprobar el saldo

La cuenta que desplegó el contrato tiene el millón inicial. Cualquier otra cuenta empieza en 0 hasta que reciba un `transfer`.

## Acciones mínimas a demostrar (defensa)

| Acción | Qué mostrar |
|--------|-------------|
| Ver balance | MetaMask (TWOKEN) y/o `balanceOf` en Remix |
| Transferir | Enviar 1 TWOKEN a una segunda address; tx en BscScan |
| Aprobar (si pregunta el evaluador) | `approve` + `transferFrom` son del estándar ERC-20; no son necesarias para la demo mínima |
| Ownership | No hay funciones admin; ver `documentation/03-security.md` |

Cantidad de 1 token con 18 decimals: `1000000000000000000`.

## Flujo recomendado de demo

1. Abrir https://testnet.bscscan.com/address/0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF
2. Mostrar que el contrato existe (y el código si está verificado)
3. MetaMask: saldo de la cuenta deployer
4. `transfer` de una cantidad pequeña a una segunda cuenta de test
5. Comprobar balances + tx en BscScan
6. Explicar: no hay mint/pause; el deployer no tiene privilegios de contrato

**Pendiente siguiente sesión:** el `transfer` on-chain entre dos cuentas MetaMask (en Remix VM ya se hizo).

## Enlaces útiles

- Faucet: https://www.bnbchain.org/en/testnet-faucet
- Explorer del contrato: https://testnet.bscscan.com/address/0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF
- RPC: `https://bsc-testnet-rpc.publicnode.com` (Chain ID 97)
- Añadir red: [Chainlist (testnets, BSC Testnet)](https://chainlist.org/?testnets=true&search=bnb+smart+chain+testnet)
- Remix: https://remix.ethereum.org
