# README

## Usage

### List political organizations

`GET http://politicalhub-api.herokuapp.com/political_organizations`

Sample response:

```json
[
  {
    "id": 2,
    "name": "PARTIDO PATRIOTICO DEL PERU",
    "slug": "partido-patriotico-del-peru",
    "logo": "https://aplicaciones007.jne.gob.pe//srop_publico/Consulta/Simbolo/GetSimbolo/2859"
  },
  {
    "id": 18,
    "name": "PERU NACION",
    "slug": "peru-nacion",
    "logo": "https://aplicaciones007.jne.gob.pe//srop_publico/Consulta/Simbolo/GetSimbolo/2649"
  }
]
```

### List candidates

`GET http://politicalhub-api.herokuapp.com/candidates`

Search params:

| Param | Description | Default value |
|-------|-------------|---------------|
| `electoral_process` | The JNE ID for the electoral process the candidates are participating at. | `110` |
| `political_organization`| The internal ID for the political organization the candidates belong to. You can get them from `http://politicalhub-api.herokuapp.com/political_organizations`. | `2` |
| `ubigeo` | The UBIGEO code related to the electoral department the candidates are running for. Check [Ubigeos](#ubigeos). | `140100` |
| `office` | The ID for the office the candidates are running for. `1` for presidential candidates and `2` for Congress candidates. | `1` |
| `properties_value` | Filter candidates that match their total properties value with a certain value. | `250000` |
| `properties_value_greater_than` | Filter candidates that have total properties value greater than certain value. | `250000` |

### Ubigeos

| Code | Department |
|------|------------|
| 140101 | Peruanos residentes en el extranjero |
| 010000 | Amazonas |
| 020000 | Ancash |
| 030000 | Apurimac |
| 040000 | Arequipa |
| 050000 | Ayacucho |
| 060000 | Cajamarca |
| 240000 | Callao |
| 070000 | Cusco |
| 080000 | Huancavelica |
| 090000 | Huanuco |
| 100000 | Ica |
| 110000 | Junin |
| 120000 | La Libertad |
| 130000 | Lambayeque |
| 140000 | Lima provincias |
| 140100 | Lima |
| 150000 | Loreto |
| 160000 | Madre de Dios |
| 170000 | Moquegua |
| 180000 | Pasco |
| 190000 | Piura |
| 200000 | Puno |
| 210000 | San Martin |
| 220000 | Tacna |
| 230000 | Tumbes |
| 250000 | Ucayali |
