document.addEventListener('DOMContentLoaded', function () {
    var tableLimit = document.querySelector('.table-limit');
    var tableFull = document.querySelector('.full-table');
    var voirTousBtn = document.getElementById('voirTousBtn');
    var voirMoinsBtn = document.getElementById('voirMoinsBtn');

    tableFull.style.display = 'none';

    voirTousBtn.addEventListener('click', function () {
        tableLimit.style.display = 'none';
        tableFull.style.display = 'block';
    });

    voirMoinsBtn.addEventListener('click', function () {
        tableFull.style.display = 'none';
        tableLimit.style.display = 'block';
    });

    var endValue = document.querySelector('.avg-region').getAttribute('data-avg');
    var endNumber = parseFloat(endValue);
    var counterElement = document.getElementById('counter');

    var endSum = document.querySelector('.total-region').getAttribute('data-sum');
    var endSumNumber = parseFloat(endSum);
    var sumElement = document.getElementById('totalCoal');

    var endMax = document.querySelector('.max-region').getAttribute('data-max');
    var endMaxNumber = parseFloat(endMax);
    var maxElement = document.getElementById('maxCoal');

    var endMin = document.querySelector('.min-region').getAttribute('data-min');
    var endMinNumber = parseFloat(endMin);
    var minElement = document.getElementById('minCoal');

    var endValueCountry = document.querySelector('.avg-country').getAttribute('data-avg-country');
    var endNumberCountry = parseFloat(endValueCountry);
    var counterElementCountry = document.getElementById('counter2');

    var endSumCountry = document.querySelector('.total-country').getAttribute('data-sum-country');
    var endSumNumberCountry = parseFloat(endSumCountry);
    var sumElementCountry = document.getElementById('totalCoalCountry');

    var endMaxCountry = document.querySelector('.max-country').getAttribute('data-max-country');
    var endMaxNumberCountry = parseFloat(endMaxCountry);
    var maxElementCountry = document.getElementById('maxCoalCountry');

    var endMinCountry = document.querySelector('.min-country').getAttribute('data-min-country');
    var endMinNumberCountry = parseFloat(endMinCountry);
    var minElementCountry = document.getElementById('minCoalCountry');

    var options = {
        duration: 1000, 
        separator: ',',  
    };

    animateCounter(counterElement, endNumber, options);
    animateCounter(sumElement, endSumNumber, options);
    animateCounter(maxElement, endMaxNumber, options);
    animateCounter(minElement, endMinNumber, options);
    animateCounter(counterElementCountry, endNumberCountry, options);
    animateCounter(sumElementCountry, endSumNumberCountry, options);
    animateCounter(maxElementCountry, endMaxNumberCountry, options);
    animateCounter(minElementCountry, endMinNumberCountry, options);


    function animateCounter(element, endValue, options) {
        options = options || {};
        var duration = options.duration || 2000;
        var separator = options.separator || '';
    
        var startValue = 0;
        var startTime;
        var endTime;
    
        function runAnimation(timestamp) {
            if (!startTime) startTime = timestamp;
    
            var progress = timestamp - startTime;
    
            if (progress < duration) {
                var value = startValue + (endValue - startValue) * (progress / duration);
    
                var formattedValue = formatCounterValue(value, separator);

                element.textContent = formattedValue;

                requestAnimationFrame(runAnimation);
            } else {
                element.textContent = formatCounterValue(endValue, separator);
            }
        }
    
        requestAnimationFrame(runAnimation);
    }
    
    function formatCounterValue(value, separator) {
        var formattedValue = separator ? value.toLocaleString() : value;
        return formattedValue;
    }

    const searchInput = document.getElementById('searchInput');

    searchInput.addEventListener('input', function () {
        const searchValue = searchInput.value.toLowerCase();

        fetch(`/get_countries?search=${searchValue}`)
            .then(response => response.json())
            .then(data => updateSearchResults(data.countries))
            .catch(error => console.error('Erreur lors de la récupération des pays:', error));
    });

    function updateSearchResults(results) {
        const searchResults = document.getElementById('searchResults');

        if (searchInput.value.trim() === '') {
            searchResults.innerHTML = '';
            return;
        }

        searchResults.innerHTML = '';

        if (results && results.length > 0) {
            results.forEach(result => {
                const resultItem = document.createElement('p');
                resultItem.textContent = result;

                resultItem.addEventListener('click', () => {
                    searchInput.value = result;
                    searchResults.innerHTML = '';
                });

                searchResults.appendChild(resultItem);
            });
        } else {
            searchResults.textContent = 'Pas de données';
        }
    }

    const form = document.querySelector('.calcul form');
    const emissionInput = form.querySelector('input[name="emission"]');
    const hourInput = form.querySelector('input[name="hour"]');
    const powerInput = form.querySelector('input[name="power"]');
    const resultOutput = document.createElement('p');

    form.addEventListener('submit', function (event) {
        event.preventDefault();


        const emission = parseFloat(emissionInput.value);
        const hour = parseFloat(hourInput.value);
        const power = parseFloat(powerInput.value);

        const result = emission * hour * power;

        resultOutput.textContent = `Émission annuelle : ${result.toFixed(3)} kgCO2`;

        form.appendChild(resultOutput);
    });
});
