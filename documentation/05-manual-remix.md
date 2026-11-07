# Manual Remix — fortytwoken42 (BEP-20)

Guía clic a clic para compilar, probar y desplegar el token en **BNB Smart Chain Testnet**.

**Datos del token**

| Campo | Valor |
|-------|--------|
| Nombre | `fortytwoken42` |
| Ticker | `TWOKEN` |
| Decimals | `18` |
| Supply | `1_000_000` (al deployer) |
| Red | BNB Smart Chain Testnet (Chain ID **97**) |
| Archivo del contrato | `code/Fortytwoken42.sol` |
| Address testnet | `0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF` |
| Explorer | https://testnet.bscscan.com/address/0xEDEEB2a12e8ba717a0E04c2D82eEa947669CDbFF |

---

## 0. Antes de abrir Remix

- [ ] MetaMask instalado
- [ ] Red **BNB Smart Chain Testnet** seleccionada
- [ ] Saldo **tBNB > 0**
- [ ] Código en `code/Fortytwoken42.sol` (o lo pegarás en Remix)

---

## 1. Abrir Remix

1. Entra en [https://remix.ethereum.org](https://remix.ethereum.org)
2. Si pregunta por un workspace, elige **Create a new workspace** o usa el default
3. En el menú izquierdo, icono de **carpeta** = File Explorer

---

## 2. Crear el archivo del contrato

1. En `contracts/` (o en la raíz del workspace): clic derecho → **New File**
2. Nombre: `Fortytwoken42.sol`
3. Abre `code/Fortytwoken42.sol` de este repo y **copia todo** el contenido a Remix  
   (o pégalo desde el repo si lo tienes al lado)

4. Guarda: `Ctrl+S`

---

## 3. Compilar

1. Icono izquierdo: **Solidity Compiler** (forma de “S”)
2. **Compiler:** `0.8.20` o superior compatible (`0.8.20`–`0.8.28` va bien)
3. Activa **Auto compile** (opcional) o pulsa **Compile Fortytwoken42.sol**
4. Debe aparecer un **check verde** en el icono del compilador

### Si falla la import de OpenZeppelin

Remix descarga `@openzeppelin/...` solo. Si da error:

1. En la barra superior: **File Explorer** → asegúrate de que el `import` coincide con el del archivo
2. Prueba **Compile** otra vez
3. O en Remix: busca el plugin / deja que resuelva el módulo (a veces pide confirmar la descarga)

---

## 4. Probar en la VM de Remix (sin gastar tBNB)

Sirve para entender `transfer` / `balanceOf` antes del deploy real.

1. Icono izquierdo: **Deploy & Run Transactions** (Ethereum logo)
2. **Environment:** `Remix VM (Shanghai)` o `Remix VM (Cancun)`
3. **Account:** deja la primera cuenta de la lista (tiene ETH de mentira)
4. Contrato: selecciona `Fortytwoken42`
5. Pulsa **Deploy**
6. Abajo, en **Deployed Contracts**, expande el contrato

### Qué probar

| Acción | Cómo | Objetivo |
|--------|------|----------|
| Ver nombre | `name` → call | Debe salir `fortytwoken42` |
| Ver ticker | `symbol` → call | `TWOKEN` |
| Decimals | `decimals` → call | `18` |
| Supply | `totalSupply` → call | `1000000` + 18 ceros |
| Tu balance | `balanceOf` → pega tu address de la Account | Casi todo el supply |
| Transfer | En **Account** cambia a la 2ª cuenta, copia su address. Vuelve a la 1ª. En `transfer`: address 2ª + cantidad (ej. `1000000000000000000` = 1 token) → **transact** | La 2ª cuenta tiene balance |

**Nota sobre cantidades:** con 18 decimals, `1 TWOKEN` = `1000000000000000000` (1 + 18 ceros).  
En Remix a veces puedes usar la UI que convierte; si no, usa esa notación.

Cuando esto funcione, ya sabes la demo. Siguiente: red real de test.

---

## 5. Conectar MetaMask (BSC Testnet)

1. En MetaMask: red **BNB Smart Chain Testnet** + tBNB
2. En Remix → **Deploy & Run**:
   - **Environment:** `Injected Provider - MetaMask`
3. MetaMask pedirá conectar → **Connect** / **Aceptar**
4. Comprueba que Remix muestra tu address y **Chain ID 97** (o el nombre de la testnet)

Si pone Chain ID **56** o Ethereum: **cambia la red en MetaMask** y recarga Remix.

---

## 6. Deploy en testnet

1. Contrato seleccionado: `Fortytwoken42`
2. Pulsa **Deploy**
3. MetaMask se abre → revisa:
   - Red: testnet
   - Gas pagado en **tBNB**
4. Confirma
5. Espera a que Remix ponga el contrato en **Deployed Contracts**
6. **Copia la address del contrato** (icono de copiar al lado del nombre)

### Guárdala ya

Pégala en el `README.md` raíz (tabla Despliegue) y en `deployment/`.

Ejemplo de explorer:

`https://testnet.bscscan.com/address/TU_ADDRESS_AQUI`

---

## 7. Comprobar en BscScan + MetaMask

1. Abre el enlace del explorer → debe verse el contrato y la tx de creación
2. En MetaMask (testnet) → **Import tokens** → pega la address del contrato  
   - Symbol: `TWOKEN`  
   - Decimals: `18`
3. Deberías ver **1,000,000 TWOKEN** (o el supply que mintaste)

### Demo mínima on-chain

1. Crea/abre una **segunda cuenta** en MetaMask (o usa otra wallet)
2. Copia su address
3. Desde Remix (contrato desplegado) o desde MetaMask: **transfer** unos tokens
4. Confirma en MetaMask
5. Revisa balances + tx en BscScan

---

## 8. Qué guardar en el repo

| Dónde | Qué |
|-------|-----|
| `code/Fortytwoken42.sol` | Código fuente (ya en el repo) |
| `deployment/` | Pasos, address, fecha, red, enlace BscScan |
| `README.md` | Address + ticker + red |
| `documentation/` | Overview / how-to actualizados |

---

## Errores frecuentes

| Error | Qué mirar |
|-------|-----------|
| Compile failed / import | Versión del compiler; recompilar; import OpenZeppelin |
| MetaMask no conecta | Environment = Injected Provider; desbloquear MetaMask |
| Wrong network | MetaMask en Testnet (97), no mainnet (56) |
| Insufficient funds | Sin tBNB → faucet / compañero |
| User rejected | Cancelaste la firma → vuelve a Deploy |
| No veo el token | Importar por address del contrato en MetaMask |

---

## Checklist de esta fase

- [x] Compila en Remix
- [x] Probado `name` / `symbol` / `transfer` en Remix VM
- [x] Deploy en BSC Testnet confirmado
- [x] Address guardada en README + deployment
- [x] Token importado en MetaMask
- [ ] Al menos un `transfer` on-chain hecho (siguiente sesión: 1 TWOKEN a una 2ª cuenta)
- [x] Enlace BscScan apuntado
