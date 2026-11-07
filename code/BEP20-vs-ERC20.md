# BEP-20 vs ERC-20

Comparativa para decidir el estándar del token en este proyecto.

## Resumen rápido

| | **ERC-20** | **BEP-20** |
|---|------------|------------|
| Blockchain | Ethereum (y L2 compatibles) | BNB Smart Chain (BSC) |
| Origen | Estándar oficial de Ethereum | Estándar de BNB Chain **inspirado en ERC-20** |
| Interfaz | Casi idéntica | Compatible / equivalente en la práctica |
| Gas / fees | Más caras (ETH) | Más baratas (BNB) |
| Velocidad | Más lenta en L1 | Bloques ~3 s, más rápida |
| Explorer típico | Etherscan | BscScan |
| Encaja con este subject | Válido | **Recomendado** (partenariado 42 × BNB) |

## Qué tienen en común

Ambos definen un **token fungible** con la misma idea de API:

| Función / evento | Para qué sirve |
|------------------|----------------|
| `name()` / `symbol()` / `decimals()` | Metadatos del token |
| `totalSupply()` | Cantidad total existente |
| `balanceOf(account)` | Saldo de una address |
| `transfer(to, amount)` | Enviar tokens |
| `approve(spender, amount)` | Autorizar a otro contrato/wallet |
| `allowance(owner, spender)` | Cuánto queda autorizado |
| `transferFrom(from, to, amount)` | Transferir usando allowance |
| `Transfer` / `Approval` | Eventos on-chain |

Si sabes escribir un ERC-20, el contrato BEP-20 se escribe **casi igual** (misma lógica Solidity).

## Diferencias reales

### 1. La red, no el código
La diferencia principal **no es el Solidity**, sino **dónde lo despliegas**:
- ERC-20 → Ethereum / testnets ETH (Sepolia, etc.)
- BEP-20 → BNB Smart Chain / **BSC Testnet**

### 2. Token nativo para gas
- ERC-20: pagas gas en **ETH**
- BEP-20: pagas gas en **BNB** (en testnet: **tBNB** del faucet)

### 3. Tooling y ecosistema
- Misma familia de tools: Remix, Hardhat, OpenZeppelin, MetaMask
- Cambian RPC, Chain ID, faucet y explorer

### 4. “BEP-20” como etiqueta
BEP-20 es el nombre del estándar en BNB Chain. Técnicamente es un token **compatible con la interfaz ERC-20** en una EVM chain distinta.

## Qué elegir para Tokenizer (42)

| Criterio | Recomendación |
|----------|---------------|
| Subject (BNB partnership) | **BEP-20 en BSC Testnet** |
| Aprender el estándar de tokens | Da igual: la interfaz es la misma |
| Coste y facilidad de demo | BSC Testnet suele ser más cómodo |
| Solo “Ethereum puro” | ERC-20 en Sepolia también cumple el subject |

**Conclusión práctica:** elige **BEP-20** salvo que tengas un motivo claro para Ethereum. El código del contrato será el mismo tipo; cambia la red de deploy y la documentación (address, explorer, faucet).

## Checklist al documentar tu elección

En el `README.md` raíz conviene dejar escrito:

- [x] Estándar elegido: **BEP-20**
- [x] Red concreta: **BNB Smart Chain Testnet** (Chain ID 97)
- [x] Por qué: partnership 42 × BNB, misma API que ERC-20, faucet tBNB y BscScan
- [x] Explorer + address: https://testnet.bscscan.com/address/0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF
