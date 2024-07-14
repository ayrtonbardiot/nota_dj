Config = {}
Config.UsedLocale = 'fr'

Config.Locales = {
    ['en'] = {
        open_table = 'Open DJ Table',
        pause_music = 'Pause Music',
        resume_music = 'Resume Music',
        stop_music = 'Stop Music',
        label_url = 'Music URL'
    },
    ['fr'] = {
        open_table = 'Ouvrir la table de DJ',
        pause_music = 'Mettre en pause la musique',
        resume_music = 'Remettre la musique',
        stop_music = 'Arrêter la musique',
        label_url = 'URL de la musique'
    }
}

-- zone for turntables
-- static emitters allow to disable some ambient sound (like in vanilla unicorn, nightclub, etc...)
-- to find the emitters please check https://github.com/DurtyFree/gta-v-data-dumps/blob/master/staticEmitters.json
Config.Zones = {
    ['bahama_mamas'] = {
        position = vector3(-1381.7725, -616.6743, 31.4980),
        boxSize = vector3(2, 2, 1),
        rotation = 45,
        distance = 30,
        volume = 45,
        static_emitters = {}
    },
    ['vanilla_unicorn'] = {
        position = vector3(120.1123, -1281.0994, 29.4805),
        boxSize = vector3(2, 2, 1),
        rotation = 45,
        distance = 30,
        volume = 45,
        static_emitters = {
            'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
            'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
            'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
        }
    },
    ['after_hours_nc'] = {
        position = vector3(-1603.0103, -3012.3589, -77.7961),
        boxSize = vector3(2, 2, 1),
        rotation = 45,
        distance = 30,
        volume = 45,
        static_emitters = {
            'se_ba_dlc_int_01_main_area_2',
            'se_ba_dlc_int_01_main_area',
            'se_ba_dlc_int_01_rear_l_corridor',
            'se_ba_dlc_int_01_bogs',
            'se_ba_dlc_int_01_bars',
            'se_ba_dlc_int_01_entry_hall',
            'se_ba_dlc_int_01_garage',
            'se_ba_dlc_int_01_office',
            'se_ba_dlc_int_01_entry_stairs'
        }
    }
}