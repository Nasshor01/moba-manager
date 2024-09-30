extends Node

var config = preload("res://scripts/config.gd")
var api_key = config.RIOT_API_KEY
var base_url = "https://eun1.api.riotgames.com/lol/"

func _ready():
    # Otevřeme databázi
    db_manager.open_database()

    # Zavoláme Riot API pro získání summoner dat
    riot_api.get_summoner_data("Caps")  # Nahraďte jménem hráče, kterého chcete najít

# Když data z API přijdou, uložíme je do databáze
func _on_request_completed(result, response_code, headers, body):
    if response_code == 200:
        var json_data = JSON.parse(body.get_string_from_utf8())
        if json_data.error == OK:
            var summoner_data = json_data.result
            # Uložení dat do SQLite databáze
            db_manager.insert_summoner_data(summoner_data)
        else:
            print("Chyba při zpracování dat z API")
    else:
        print("API request selhal s kódem: ", response_code)
