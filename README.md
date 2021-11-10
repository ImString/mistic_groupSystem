# MST_groupSystem - API

## Precisa de uma ajuda para encontrar oque precisa?
- [UtilsAPI](#utils)
- [Player Economy API](#social)

## UtilsAPI

* Verificar se um Player está em determinado grupo

```Lua
bool isPlayerInGroup(player, groupTag)
```

* Pegar um grupo do Player
```Lua
table getGroupFromPlayer(player)
```

## Player Economy API

* Pegar o saldo do jogador referente ao grupo
```Lua
int getPlayerBalance(player)
```

* Setar o saldo do jogador referente ao grupo
```Lua
boolean setPlayerBalance(player, balance)
```

* Adicionar o saldo do jogador referente ao grupo
```Lua 
boolean addPlayerBalance(player, balance)
```

* Remover o saldo do jogador referente ao grupo
```Lua
boolean takePlayerBalance(player, balance)
```

## LOGS SYSTEM

* Criar uma log na aba de historico do grupo
```Lua
boolean createLog(groupTag, message)
```

## GROUP ECONOMY SYSTEM

* Pegar o saldo atual do grupo
```Lua
boolean getGroupBalance(groupTag)
```

* Setar o saldo total do grupo
```Lua
boolean setGroupBalance(groupTag, balance)
```

* Adicionar o saldo do grupo
```Lua
boolean addGroupBalance(groupTag, balance)
```

* Remover o saldo do grupo
```Lua
boolean takeGroupBalance(groupTag, balance)
```