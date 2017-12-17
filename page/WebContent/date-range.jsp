<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>Pikaday - Date Range example</title>
    <meta name="author" content="David Bushell">
    <link rel="stylesheet" href="Pikaday-master/css/pikaday.css">
    <link rel="stylesheet" href="Pikaday-master/css/site.css">
</head>
<body>
    <h1>Pikaday - Date Range example</h1>

    <p class="large">A refreshing JavaScript Datepicker — lightweight, no dependencies, modular CSS.</p>

    <p><a href="https://github.com/dbushell/Pikaday"><strong>Pikaday source on GitHub</strong></a></p>

    <div style="display: inline-block">
        <label for="start">Start:</label>
        <br>
        <input type="text" id="start">
    </div>

    <div style="display: inline-block">
        <label for="end">End:</label>
        <br>
        <input type="text" id="end">
    </div>

    <h2>What is this?</h2>

    <p>Since version 1.0 Pikaday is a stable and battle tested date-picker. Feel free to use it however you like but please report any bugs or feature requests to the <a href="https://github.com/dbushell/Pikaday/issues">GitHub issue tracker</a>, thanks!</p>

    <p class="small">Copyright &copy; 2014 <a href="http://dbushell.com/">David Bushell</a> | BSD &amp; MIT license</p>


    <script src="Pikaday-master/pikaday.js"></script>
    <script>
    var startDate,
        endDate,
        updateStartDate = function() {
            startPicker.setStartRange(startDate);
            endPicker.setStartRange(startDate);
            endPicker.setMinDate(startDate);
        },
        updateEndDate = function() {
            startPicker.setEndRange(endDate);
            startPicker.setMaxDate(endDate);
            endPicker.setEndRange(endDate);
        },
        startPicker = new Pikaday({
            field: document.getElementById('start'),
            minDate: new Date(),
            maxDate: new Date(2020, 12, 31),
            onSelect: function() {
                startDate = this.getDate();
                updateStartDate();
            }
        }),
        endPicker = new Pikaday({
            field: document.getElementById('end'),
            minDate: new Date(),
            maxDate: new Date(2020, 12, 31),
            onSelect: function() {
                endDate = this.getDate();
                updateEndDate();
            }
        }),
        _startDate = startPicker.getDate(),
        _endDate = endPicker.getDate();

        if (_startDate) {
            startDate = _startDate;
            updateStartDate();
        }

        if (_endDate) {
            endDate = _endDate;
            updateEndDate();
        }
    </script>
</body>
</html>