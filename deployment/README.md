# deployment/

Datos y pasos para el token **fortytwoken42** en BSC Testnet.

Guía clic a clic (Remix): [../documentation/05-manual-remix.md](../documentation/05-manual-remix.md)

## Datos del deploy (hecho)

| Campo | Valor |
|-------|-------|
| Red | BNB Smart Chain Testnet |
| Chain ID | **97** |
| RPC (ejemplo) | `https://bsc-testnet-rpc.publicnode.com` |
| Currency (gas) | tBNB |
| Faucet | https://www.bnbchain.org/en/testnet-faucet |
| Contract address | `0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF` |
| Explorer | https://testnet.bscscan.com/address/0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF |
| Nombre / ticker | fortytwoken42 / **TWOKEN** |
| Decimals | 18 |
| Supply | 1_000_000 (mint único en el constructor, al deployer) |
| Herramienta | Remix IDE + Injected Provider (MetaMask) |
| Compiler | Solidity `^0.8.20` (p. ej. 0.8.20–0.8.28) |
| Deployer | Cuenta MetaMask que confirmó el Deploy (no guardar seed ni clave en el repo) |

**Importante:** la address de Remix VM (`0xd914…` u otras) **no** es este contrato. Solo cuenta la de testnet de arriba.

## Cómo se desplegó

1. Compilar `code/Fortytwoken42.sol` en Remix (OpenZeppelin ERC-20).
2. Probar `name` / `symbol` / `transfer` en **Remix VM**.
3. Environment → **Injected Provider - MetaMask**.
4. MetaMask en **BNB Smart Chain Testnet** (97), con tBNB.
5. **Deploy** (constructor sin parámetros) → confirmar en MetaMask.
6. Copiar address → comprobar en BscScan Testnet.
7. Importar token en MetaMask con esa address.

No hay scripts Hardhat ni `.env`. Remix no necesita clave privada en el repo: la firma es MetaMask.

## Verificar el contrato en el explorer (opcional, siguiente sesión)

El contrato **ya es visible** en BscScan. Verificar el *código fuente* es extra:

1. Abrir el explorer del contrato → **Contract** → **Verify and Publish** (si aparece).
2. Compiler: misma versión que Remix, licencia MIT, optimization como en Remix.
3. Pegar el código o usar verificación via Remix (plugin Etherscan / BscScan) con API key del explorer.

Sin verificar, la demo sigue siendo válida: se ve la address, las txs y se puede llamar a `name`/`symbol` desde Remix.

## Checklist de despliegue

1. [x] Wallet con fondos de test (faucet)
2. [x] Red de test configurada (Chain ID 97)
3. [x] Contrato desplegado
4. [x] Dirección del contrato anotada en el `README.md` raíz
5. [x] Contrato visible en el explorer (código fuente: opcional)
6. [x] Ticker definido y visible (`TWOKEN`)
7. [x] Token importado en MetaMask (cuenta deployer)
8. [ ] `transfer` on-chain a una segunda cuenta (siguiente sesión)
