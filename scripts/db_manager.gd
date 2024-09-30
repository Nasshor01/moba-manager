extends Node

var db = null

# Funkce pro otevření databáze
func open_database():
    db = SQLite.new()
    if db.open("user://moba_manager.db"):
        print("Databáze byla úspěšně otevřena nebo vytvořena.")
    else:
        print("Nepodařilo se otevřít databázi.")

# Vytvoření tabulek pro hráče a týmy
func create_tables():
    db.query("CREATE TABLE IF NOT EXISTS players (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, role TEXT, kills INTEGER, deaths INTEGER, assists INTEGER);")
    db.query("CREATE TABLE IF NOT EXISTS teams (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);")

# Vložení hráče do tabulky
func insert_player(name, role):
    db.query("INSERT INTO players (name, role, kills, deaths, assists) VALUES (?, ?, 0, 0, 0);", [name, role])
    print("Hráč přidán: ", name)

# Načtení všech hráčů
func get_all_players():
    var result = db.query("SELECT * FROM players;")
    while result.step():
        var player_data = result.get_row_dict()
        print(player_data)

# Funkce pro uložení summoner dat do databáze
func insert_summoner_data(summoner_data):
    db.query("INSERT INTO players (name, role, kills, deaths, assists) VALUES (?, ?, 0, 0, 0);", [summoner_data.name, "Unknown"])
    print("Summoner data přidána do databáze: ", summoner_data.name)