extends Node

# Načteme náš db_manager skript
var db_manager = preload("res://scripts/db_manager.gd")

func _ready():
    # Otevřeme databázi
    db_manager.open_database()
    
    # Vytvoříme tabulky
    db_manager.create_tables()
    
    # Vložíme hráče
    db_manager.insert_player("Caps", "Mid")
    db_manager.insert_player("Jankos", "Jungle")
    
    # Načteme a vypíšeme všechny hráče
    db_manager.get_all_players()
