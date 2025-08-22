config = {
    BindOpen = "F4", -- Botao para abrir o painel
    MaxMember = 30, -- Maximo de membros por padrão
    DelayOpen = 3, -- Tempo para abrir o menu (em segundos). Recomendado deixar pelo menos 1.
    
    ElementData = {
        ID = "ID", -- ElementData de ID
    },

    GroupCreateCommand = {
        ["ACL"] = "Console",
        ["Command"] = "creategroup",
        ["Aliases"] = { "groupcreate", "groupCreate", "createGroup" },
    },

    ACLHelp = {
        State = true, -- Caso queira que esteja ativo coloque "true" se não coloque "false" (istó é o suporte total do groups a ACL)
        PoliceAcl = "Policie", -- Lembrando que toda vez que o script ligar, ele irá resetar todos os jogadores que estão na determinada ACL
        FactionAcl = "Faction",
    },
    
    GroupsRoles = {
        ["NONE"] = { -- Sem grupo
            Corporation = "Nenhum",
            Faction = "Nenhum",
        },
        ["RECRUIT"] = { -- Cargo de recruta
            Corporation = "Recruta",
            Faction = "Teste",
        },
        ["MEMBER"] = { -- Cargo de membro
            Corporation = "Recruta",
            Faction = "Membro",
        },
        ["CAPTAIN"] = { -- Cargo de membro
            Corporation = "Capitao",
            Faction = "Braço direito",
        },
        ["LEADER"] = { -- Cargo de membro
            Corporation = "Lider",
            Faction = "Dono do Morro",
        },
    },

    Interface = {
        Background = { 239, 239, 239 }, -- Fundo do menu
        MenuBar = { 41, 44, 55 }, -- Barra de menu do lado
        IconSelected = { 255, 255, 255 },
        IconNotSelected = { 93, 96, 100 },
        SelectorTab = { 152, 71, 255 },
        ButtonColor = { 54, 58, 66 },
        ButtonColorPassed = { 60, 65, 75 },
    },
    
    -- Infobox
    notifyS = function (player, text, type, seconds)
        player:triggerEvent("MST.sendPlayerNotification", player, text, type, (seconds or 5))
    end,
    
    notifyC = function (text, type, seconds)
        triggerEvent("MST.sendPlayerNotification", localPlayer, text, type, (seconds or 5))
    end
}