$(function() {
  $("input[id^='player-group-users-tokens']").tokenInput("/users.json", {
    crossDomain: false,
    prePopulate: $(this).data("pre"),
    preventDuplicates: true,
    theme: "facebook",
    minChars: 3,
    hintText: "Search for players...",
    resultsLimit: 10,
    onAdd: function(player) {
        $.ajax({
            url: "/game_player_groups/" + this.data("game-player-group-id") + "/player_group_users",
            method: "POST",
            data: {
                id: player.id
            }
        });
    },
    onDelete: function(player) {
        $.ajax({
            url: "/game_player_groups/" + this.data("game-player-group-id") + "/users/" + player.id,
            method: "DELETE"
        });
    }
  });
});

