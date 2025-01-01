Config = {}
Config.Debug = false
-- Notifications et intégration Discord
Config.Notification = "Un cheval sauvage est apparu dans la zone!"
Config.NotificationOn = false  -- Activer les notifications dans le jeu //TO DO
Config.DiscordIntegration = true  -- Activer l'intégration Discord
-- Paramètres de spawn aléatoire
Config.RNGTimer = 6000  -- Temps entre chaque vérification de spawn (en millisecondes) Si vous augmentez trop la valeur, peux provoquer des lags
Config.RespawnDelay = 1000  -- Délai entre les apparitions de chevaux (en millisecondes)
Config.Radius = 100  -- Rayon autour du joueur où les chevaux peuvent apparaître (en mètres)
-- Paramètres de spawn
Config.Spawns = {
    -- American Paint
    {
        breed = "American Paint",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,  -- Minimum de chevaux par spawn
        maxHorses = 3,  -- Maximum de chevaux par spawn
        locations = {
            vector3(-969.48, -571.12, 97.65)  -- Zone de spawn dans les montagnes
        },
        horses = {
            `A_C_Horse_AmericanPaint_Greyovero`,
            `A_C_Horse_AmericanPaint_Overo`,
            `A_C_Horse_AmericanPaint_SplashedWhite`,
            `A_C_Horse_AmericanPaint_Tobiano`,
        }
    },
    -- American Standart
    {
        breed = "American Paint",
        spawnChance = 4,  -- 0.25% chance
        minHorses = 1,  -- Minimum de chevaux par spawn
        maxHorses = 3,  -- Maximum de chevaux par spawn
        locations = {
            vector3(-677.87, -770.50, 42.30),  -- Zone de spawn dans les montagnes
        },
        horses = {
            `A_C_Horse_AmericanStandardbred_Black`,
            `A_C_Horse_AmericanStandardbred_Buckskin`,
            `A_C_Horse_AmericanStandardbred_Lightbuckskin`,
            `A_C_Horse_AmericanStandardbred_PalominoDapple`,
            `A_C_Horse_AmericanStandardbred_SilverTailBuckskin`,
        }
    },
    -- Pur Sang Arabe (Arabian) - Zone spécifique
    {
        breed = "Arabian",
        spawnChance = 1,  -- 0.25% chance
        minHorses = 0,  -- Minimum de chevaux par spawn
        maxHorses = 3,  -- Maximum de chevaux par spawn
        locations = {
            vector3(-2028.58, 1820.65, 250.51),  -- Zone de spawn dans les montagnes
        },
        horses = {
            `a_c_horse_arabian_black`,
            `a_c_horse_arabian_grey`,
            `A_C_Horse_Arabian_RedChestnut`,
            `A_C_Horse_Arabian_RedChestnut_PC`,
            `a_c_horse_arabian_rosegreybay`,
            `A_C_Horse_Arabian_WarpedBrindle_PC`,
            `a_c_horse_arabian_white`,
            `a_c_horse_gang_dutch`,
        }
    },

    -- Pur Sang Neige (Arabian White) - Zone d'altitude enneigée
    {
        breed = "Arabian White",
        spawnChance = 1,  -- 0.25% chance
        minHorses = 1,  -- Minimum de chevaux par spawn
        maxHorses = 2,  -- Maximum de chevaux par spawn
        locations = {
            vector3(-1279.88, 2409.67, 309.27),  -- Zone d'altitude enneigée
        },
        horses = {
            `a_c_horse_arabian_white`,         -- Pur Sang Arabe Blanc
            `a_c_horse_arabian_rosegreybay`,  -- Variant du Pur Sang Arabe
        }
    },

    -- Pur Sang Anglais (English Thoroughbred) - Zone de Blackwater
    {
        breed = "English Thoroughbred",
        spawnChance = 2,  -- 0.5% chance
        minHorses = 1,  -- Minimum de chevaux par spawn
        maxHorses = 2,  -- Maximum de chevaux par spawn
        locations = {
            vector3(-729.22, -1612.45, 58.03),   -- Zone autour de Blackwater
        },
        horses = {
            `A_C_Horse_Thoroughbred_BlackChestnut`,
            `A_C_Horse_Thoroughbred_BloodBay`,
            `A_C_Horse_Thoroughbred_Brindle`,
            `A_C_Horse_Thoroughbred_DappleGrey`,
            `A_C_Horse_Thoroughbred_ReverseDappleBlack`,
        }
    },

    -- Mustang - Zone de la prairie
    {
        breed = "Mustang",
        spawnChance = 3,  -- 1% chance
        minHorses = 1,  -- Minimum de chevaux par spawn
        maxHorses = 3,  -- Maximum de chevaux par spawn
        locations = {
            vector3(-3965.01, -3480.13, 60.43), -- Zone Mustang près du Plateau
        },
        horses = {
            `A_C_Horse_Mustang_GoldenDun`,
            `A_C_Horse_Mustang_TigerStripedBay`,
            `a_c_horse_mustang_buckskin`,
            `a_c_horse_mustang_chestnuttovero`,
            `a_c_horse_mustang_reddunovero`,
            `a_c_horse_gang_lenny`,
            `a_c_horse_gang_sadie_endlesssummer`,
        }
    },

    -- Turkoman - Zone spécifique pour chevaux Turkoman
    {
        breed = "Turkoman",
        spawnChance = 2,  -- 0.5% chance
        minHorses = 1,
        maxHorses = 2,
        locations = {
            vector3(-2710.13, -1438.10, 154.95),   -- Zone montagneuse adaptée aux Turkoman
        },
        horses = {
            `A_C_Horse_Turkoman_DarkBay`,
            `A_C_Horse_Turkoman_Gold`,
            `A_C_Horse_Turkoman_Silver`,
            `a_c_horse_turkoman_chestnut`,
            `a_c_horse_turkoman_grey`,
            `a_c_horse_turkoman_perlino`,
            `a_c_horse_gang_sadie`,
        }
    },

    -- Kentucky Saddler - Zone de plaine
    {
        breed = "Kentucky Saddler",
        spawnChance = 4,  -- 1% chance
        minHorses = 1,  -- Minimum de chevaux par spawn
        maxHorses = 3,  -- Maximum de chevaux par spawn
        locations = {
            vector3(166.47, -230.78, 134.40), -- Zone boisée de Scarlett Meadows
        },
        horses = {
            `a_c_horse_kentucky_saddler_flaxen`,
            `a_c_horse_kentucky_saddler_liver_chestnut`,
            `a_c_horse_kentucky_saddler_morral`,
        }
    },

    -- Appaloosa - Zone près de la prairie
    {
        breed = "Appaloosa",
        spawnChance = 3,  -- 1% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-337.95, 1664.93, 206.04), -- Zone prairie de Cotorra Springs
        },
        horses = {
            `a_c_horse_appaloosa_blanket`,
            `a_c_horse_appaloosa_leopard`,
            `a_c_horse_appaloosa_spotted`,
        }
    },

    -- Shire - Zone montagneuse du nord
    {
        breed = "Shire",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 2,
        locations = {
            vector3(-1056.86, 873.40, 128.48), -- Zone montagneuse du nord
        },
        horses = {
            `A_C_Horse_Shire_DarkBay`,
            `A_C_Horse_Shire_LightGrey`,
            `A_C_Horse_Shire_RavenBlack	`,
        }
    },

    -- Breton - Zone de la forêt
    {
        breed = "Breton",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-1740.63, -229.65, 189.51), -- Zone boisée près de la forêt de Big Valley
        },
        horses = {
            `a_c_horse_breton_dun`,
            `a_c_horse_breton_grullo`,
            `a_c_horse_breton_redchestnut`,
        }
    },

    -- Criollo - Zone des montagnes
    {
        breed = "Criollo",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-2219.97, -22.02, 275.15), -- Zone montagnarde du sud
        },
        horses = {
            `A_C_Horse_Criollo_Baybrindle`,
            `A_C_Horse_Criollo_Bayframeovero`,
            `A_C_Horse_Criollo_Blueroanovero`,
            `A_C_Horse_Criollo_Dun`,
            `A_C_Horse_Criollo_Marblesabino`,
            `A_C_Horse_Criollo_Sorrelovero`,

        }
    },
    -- Ardenes - Zone des montagnes
    {
        breed = "Ardenes",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-2377.21, 137.30, 240.06), -- Zone montagnarde du sud
        },
        horses = {
            `A_C_Horse_Ardennes_BayRoan`,
            `A_C_Horse_Ardennes_IronGreyRoan`,
            `A_C_Horse_Ardennes_StrawberryRoan`,

        }
    },
    -- Andalusian - Zone d'espagnol
    {
        breed = "Andalusian",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-2403.97, 252.46, 199.81), -- Zone espagnole
        },
        horses = {
            `A_C_Horse_Andalusian_DarkBay`,
            `A_C_Horse_Andalusian_Perlino`,
            `A_C_Horse_Andalusian_RoseGray`,
        }
    },
    -- Belgian
    {
        breed = "Belgian",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-2541.17, 795.61, 155.28), -- Zone espagnole
        },
        horses = {
            `A_C_Horse_Belgian_BlondChestnut`,
            `A_C_Horse_Belgian_MealyChestnut`,


        }
    },
      -- Breton
      {
        breed = "Breton",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-2361.24, 861.63, 152.78), -- Zone espagnole
        },
        horses = {
            `A_C_Horse_Breton_GrulloDun`,
            `A_C_Horse_Breton_RedRoan`,
            `A_C_Horse_Breton_Sealbrown`,
            `A_C_Horse_Breton_Sorrel`,
            `A_C_Horse_Breton_SteelGrey`,


        }
    },
    -- Appaloosa - Zone d'espagnol
    {
        breed = "Appalosa",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-1962.66, 535.58, 117.63), -- Zone espagnole
        },
        horses = {
            `A_C_Horse_Appaloosa_BlackSnowflake`,
            `A_C_Horse_Appaloosa_Blanket`,
            `A_C_Horse_Appaloosa_BrownLeopard`,
            `A_C_Horse_Appaloosa_FewSpotted_PC`,
            `A_C_Horse_Appaloosa_Leopard`,
            `A_C_Horse_Appaloosa_LeopardBlanket`,

        }
    },

    -- Missouri Fox Trotter - Zone des plaines
    {
        breed = "Missouri Fox Trotter",
        spawnChance = 2,  -- 1% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-960.81, 835.40, 128.07) -- Zone prairie, large espace ouvert
        },
        horses = {
            `a_c_horse_missouri_foxtrotter_bay`,
            `a_c_horse_missouri_foxtrotter_blondchestnut`,
            `a_c_horse_missouri_foxtrotter_silverbay`,
        }
    },

    -- Tennessee Walker - Zone du sud
    {
        breed = "Tennessee Walker",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(2350.0, -1300.0, 45.5), -- Zone du sud
        },
        horses = {
            `A_C_Horse_TennesseeWalker_BlackRabicano`,
            `A_C_Horse_TennesseeWalker_Chestnut`,
            `A_C_Horse_TennesseeWalker_DappleBay`,
            `A_C_Horse_TennesseeWalker_FlaxenRoan	`,
            `A_C_Horse_TennesseeWalker_GoldPalomino_PC`,
            `A_C_Horse_TennesseeWalker_MahoganyBay	`,
            `A_C_Horse_TennesseeWalker_RedRoan	`,
        }
    },
    -- DutchWarmblood
    {
        breed = "DutchWarmblood",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 3,
        locations = {
            vector3(-3699.96, -2356.03, -9.84), -- Zone du sud
        },
        horses = {
            `A_C_Horse_DutchWarmblood_ChocolateRoan`,
            `A_C_Horse_DutchWarmblood_SealBrown`,
            `A_C_Horse_DutchWarmblood_SootyBuckskin`,
            ``,
            ``,
            ``,
        }
},
    -- Suffolk Punch - Zone montagneuse du sud
    {
        breed = "Suffolk Punch",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 2,
        locations = {
            vector3(-4025.83, -3228.63, 19.98), -- Zone montagneuse
        },
        horses = {
            `A_C_Horse_SuffolkPunch_RedChestnut`,
            `A_C_Horse_SuffolkPunch_Sorrel`,
        }
    },
    {
    -- Northfalk Roadster
        breed = "Northfalk Roadster",
        spawnChance = 4,  -- 2% chance
        minHorses = 1,
        maxHorses = 2,
        locations = {
            vector3(-2440.91, 937.02, 181.36), -- Zone montagneuse
        },
        horses = {
            `A_C_Horse_NorfolkRoadster_Black`,
            `A_C_Horse_NorfolkRoadster_DappledBuckskin`,
            `A_C_Horse_NorfolkRoadster_PiebaldRoan`,
            `A_C_Horse_NorfolkRoadster_RoseGrey`,
            `A_C_Horse_NorfolkRoadster_SpeckledGrey`,
            `A_C_Horse_NorfolkRoadster_SpottedTricolor`,
        }
    },
    {
    -- Nokota
        breed = "Nokota",
        spawnChance = 7,  -- 2% chance
        minHorses = 1,
        maxHorses = 2,
        locations = {
            vector3(-2540.60, 293.88, 155.51), -- Zone montagneuse
        },
        horses = {
            `A_C_Horse_Nokota_BlueRoan`,
            `A_C_Horse_Nokota_ReverseDappleRoan`,
            `A_C_Horse_Nokota_WhiteRoan`,
        }
    }

}




-- Paramètres de notification Discord
Config.DiscordWebhook = "https://discord.com/api/webhooks/" --TODO