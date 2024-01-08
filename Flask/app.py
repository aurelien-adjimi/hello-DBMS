from flask import Flask, render_template, jsonify, request, session
import mysql.connector
import pandas as pd

#Connexion database
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'carbonfootprint',
}

def connect_db():
    return mysql.connector.connect(**DB_CONFIG)

app = Flask(__name__)

#Code et requêtes pour la page home
@app.route('/')
def home():
    with connect_db() as connection:
        #Liste de requêtes pour la partie 5. du Big Job
        cursor = connection.cursor()
        cursor.execute("SELECT region, coal FROM world WHERE region <> 'World' ORDER BY coal DESC;")
        rank_region = cursor.fetchall()

        cursor.execute("SELECT AVG(coal) FROM world WHERE region <> 'World';")
        avg_region = cursor.fetchone()

        cursor.execute("SELECT region, coal FROM world WHERE coal = (SELECT MAX(coal) FROM world);")
        region_max = cursor.fetchall()

        cursor.execute("SELECT region, coal FROM world WHERE coal = (select MIN(coal) from world)")
        region_min = cursor.fetchall()

        cursor.execute("SELECT SUM(coal) FROM world WHERE region <> 'World'")
        total_region = cursor.fetchone()

        cursor.execute("SELECT country, coal FROM country ORDER BY coal DESC LIMIT 6")
        rank_country_limit = cursor.fetchall()

        cursor.execute("SELECT country, coal FROM country ORDER BY coal DESC")
        rank_country_full = cursor.fetchall()

        cursor.execute("SELECT AVG(coal) FROM country")
        avg_country = cursor.fetchone()

        cursor.execute("SELECT country, coal FROM country WHERE coal = (SELECT MAX(coal) FROM country)")
        country_max = cursor.fetchall()

        cursor.execute("SELECT country, coal FROM country WHERE coal = (SELECT MIN(coal) FROM country WHERE coal != 0)")
        country_min = cursor.fetchall()

        cursor.execute("SELECT SUM(coal) FROM country")
        total_country = cursor.fetchone()

        cursor.execute("SELECT * FROM country")
        get_all = cursor.fetchall()


#Formattage des données pour l'affichage dans le HTML
    avg_value = avg_region[0] if avg_region is not None and avg_region[0] is not None else None

    if region_max:
        max_region_name, max_coal_value = region_max[0]
        formatted_region_max = f"{max_region_name}:"
        formatted_region_value = max_coal_value

    else:
        formatted_region_max = None
        formatted_region_value = None

    if region_min:
        min_region_name, min_coal_value = region_min[0]
        formatted_region_min = f"{min_region_name}:"
        formatted_region_value_min = min_coal_value

    else:
        formatted_region_min = None
        formatted_region_value_min = None

    if total_region: 
        sum_coal = total_region[0]
    
    else:
        sum_coal = None

    avg_value_country = avg_country[0] if avg_country is not None else None

    if country_max:
        max_country_name, max_coal_country = country_max[0]
        formatted_country_max = f"{max_country_name}:"
        formatted_country_value_max = max_coal_country

    else:
        formatted_country_max = None
        formatted_country_value_max = None

    if country_min:
        min_country_name, min_coal_country = country_min[0]
        formatted_country_min = f"{min_country_name}:"
        formatted_country_value_min =  min_coal_country

    else:
        formatted_country_min = None
        formatted_country_value_min = None

    if total_country:
        sum_coal_country = total_country[0]

    else:
        sum_coal_country = None

#Render de la page HTML home.html
    return render_template('home.html', 
                           data = rank_region, 
                           avg_value = avg_value,
                           formatted_region_max = formatted_region_max,
                           formatted_region_value = formatted_region_value,
                           formatted_region_min = formatted_region_min,
                           formatted_region_value_min = formatted_region_value_min,
                           total_region = total_region,
                           sum_coal = sum_coal, 
                           rank_country_limit = rank_country_limit,
                           rank_country_full = rank_country_full,
                           avg_value_country = avg_value_country,
                           formatted_country_max = formatted_country_max,
                           formatted_country_value_max = formatted_country_value_max,
                           formatted_country_min = formatted_country_min,
                           formatted_country_value_min = formatted_country_value_min,
                           sum_coal_country = sum_coal_country,
                           get_all = get_all)

    

@app.route('/get_countries', methods=['GET'])
def get_countries():
    search_query = request.args.get('search', '').lower()
    
    try:
        connection = mysql.connector.connect(host='localhost', user='root', password='', database='carbonfootprint')
        cursor = connection.cursor()

        cursor.execute("SELECT country FROM country WHERE country LIKE %s", ('%' + search_query + '%',))
        countries = [row[0] for row in cursor.fetchall()]

        

        return jsonify({'countries': countries})
    
    except Exception as e:
        print(f"Erreur lors de la récupération des pays: {e}")
        return jsonify({'error': 'Erreur lors de la récupération des pays'}), 500
    
    finally:
        if connection.is_connected():
            connection.close()

@app.route('/selected_country', methods=['POST'])
def selected_country():
    with connect_db() as connection:
    #Dataframe de la table country
        query = "SELECT * FROM country"
        df = pd.read_sql(query, connection)

        #Dataframe des sources
        data = [
            ['Coal', 740, 820, 910],
            ['Gas', 410, 490, 650],
            ['Oil', 620, 740, 890],
            ['Hydro', 1, 24, 2200],
            ['Renewable', 26, 41, 60],
            ['Nuclear', 3.7, 12, 110]
        ]

        columns = ['Source', 'Min de gCO2/kWh', 'Médiane de gCO2/kWh', 'Max de gCO2/kWh']
        df_source = pd.DataFrame(data, columns=columns)

        for index, row in df_source.iterrows():
            source_name = row['Source']
            emission_column_name = f"{source_name}_emission"
            df[emission_column_name] = df[source_name] * row['Médiane de gCO2/kWh']

        emission_columns = [f'{row["Source"]}_emission' for _, row in df_source.iterrows()]

        df['Total_emission'] = df[emission_columns].sum(axis=1)

        for index, row in df_source.iterrows():
            source_name = row['Source']
            percentage_column_name = f'{source_name}_percentage'
            df[percentage_column_name] = (df[source_name] * row['Médiane de gCO2/kWh']) / df['Total_emission'] * 100
    
    selected_country = request.form.get('search-bar')

    if selected_country:
        selected_data = df[df['Country'] == selected_country]

        if not selected_data.empty:
            display_columns = ['Country', 'Coal', 'Gas', 'Oil', 'Hydro', 'Renewable', 'Nuclear']

            info_columns = ['Source', 'Utilization Percentage', 'Median gCO2/kWh', 'Contribution gCO2/kWh']
            info_data = []
            

            for source in display_columns[1:]:
                row = [
                    source,
                    selected_data[source].iloc[0],
                    df_source[df_source['Source'] == source]['Médiane de gCO2/kWh'].iloc[0],
                    round(selected_data[f'{source}_emission'].iloc[0] / 100, 3)
                ]
                info_data.append(row)


            df_info = pd.DataFrame(info_data, columns=info_columns)

            total_emission = round(df_info['Contribution gCO2/kWh'].sum(), 3)


            emission_conversion = total_emission / 1000

            hour_by_year = 24 * 365

            
            selected_display_data = selected_data[display_columns]

            return render_template('data.html', 
                                   selected_data = selected_display_data, 
                                   df_info = df_info, 
                                   total_emission = total_emission,
                                   emission_conversion = emission_conversion,
                                   hour_by_year = hour_by_year,
                                   selected_country = selected_country
                                    )
        else:
            return render_template('country_not_found.html')
    else:
        return render_template('empty_country.html')
    
@app.route('/calculate_emission', methods=['POST', 'GET'])
def calculate_emission():
    if request.method == 'POST':
        try:
            emission = float(request.form.get('emission'))
            hour = float(request.form.get('hour'))
            power = float(request.form.get('power'))
            country =  request.form.get('country')

            result = emission * hour * power

            number_of_trees = round(result / 25, 0)

            return render_template('year.html', result=result, country = country, power = power, number_of_trees = number_of_trees)

        except Exception as e:
            return render_template('year.html', error=str(e))
        
    else:
        return render_template('year.html')




if __name__ == '__main__':
    app.secret_key = 'Avion-Urticaire-Ramboutan-Enveloppe'
    app.run(debug=True)