# README

## Usage

### List political organizations

`GET http://politicalhub-api.herokuapp.com/political_organizations`

#### Sample response:

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

#### Sample response:

```json
[
  {
    "id": 1874,
    "names": "MARCIAL ALCIBIADES",
    "family_name": "PALOMINO",
    "maternal_family_name": "GARCIA MILLA",
    "date_of_birth": "1956-08-28",
    "profile_photo_url": "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/134132.jpg",
    "residence_ubigeo": "140501",
    "political_organization_id": 4,
    "postulation_ubigeo": "140000",
    "office": "CONGRESISTA DE LA REPÚBLICA",
    "secondary_office": null,
    "candidate_education_entries": [
      {
        "education_type": "primary",
        "center": null,
        "career": null,
        "finished": true
      },
      {
        "education_type": "secondary",
        "center": null,
        "career": null,
        "finished": true
      }
    ],
    "candidate_university_education_entries": [
      {
        "university": "UNIVERSIDAD NACIONAL JOSÉ FAUSTINO SÁNCHEZ CARRIÓN",
        "degree": "INGENIERO INDUSTRIAL",
        "finished": true,
        "graduated": true,
        "degree_year": 1985
      },
      {
        "university": "UNIVERSIDAD NACIONAL JOSÉ FAUSTINO SÁNCHEZ CARRIÓN",
        "degree": "BACHILLER EN INGENIERIA INDUSTRIAL",
        "finished": true,
        "graduated": true,
        "degree_year": 1984
      }
    ],
    "candidate_graduate_education_entries": [
      {
        "grad_school": "UNIVERSIDAD CESAR VALLEJO",
        "major": "MAGISTER EN ADMINISTRACION DE LA EDUCACION",
        "finished": true,
        "graduated": true,
        "degree_year": 2014,
        "master_degree": true,
        "phd": null
      }
    ],
    "candidate_work_experience_entries": [
      {
        "workplace": "CORPORACION SOL DEL NORTE SAC",
        "profession": "GERENTE DE COMERCIALIZACION",
        "start_year": 2016,
        "end_year": 2020
      },
      {
        "workplace": "UNIVERSIDAD NACIONAL JOSE FAUSTINO SANCHEZ CARRION",
        "profession": "DOCENTE UNIVERSITARIO",
        "start_year": 1991,
        "end_year": 2017
      }
    ],
    "candidate_political_party_office_entries": [
      {
        "political_organization": "PARTIDO POLÍTICO ALIANZA PARA EL PROGRESO",
        "office": "RESPONSABLE POLITICO REGIONAL",
        "start_year": 2013,
        "end_year": 2020
      }
    ],
    "candidate_previous_elected_office_entries": [
      {
        "id": 277,
        "candidate_id": 1874,
        "political_organization_id": 14,
        "political_organization_name": "PARTIDO DEMOCRATICO SOMOS PERU",
        "office_id": 9,
        "office": "REGIDOR PROVINCIAL",
        "start_year": null,
        "end_year": null,
        "comments": "",
        "jne_id": 132173,
        "created_at": "2021-01-18T22:21:38.739Z",
        "updated_at": "2021-01-18T22:21:38.748Z"
      },
      {
        "id": 278,
        "candidate_id": 1874,
        "political_organization_id": 332,
        "political_organization_name": "CONCERTACION PARA EL DESARROLLO REGIONAL - LIMA",
        "office_id": 12,
        "office": "CONSEJERO REGIONAL",
        "start_year": null,
        "end_year": null,
        "comments": "",
        "jne_id": 132172,
        "created_at": "2021-01-18T22:21:38.802Z",
        "updated_at": "2021-01-18T22:21:38.837Z"
      }
    ],
    "candidate_political_organization_resignation_entries": [
      {
        "political_organization": "MOVIMIENTO REGIONAL O DEPARTAMENTAL CONCERTACION PARA EL DESARROLLO REGIONAL - LIMA",
        "resignation_year": 2012
      }
    ],
    "candidate_criminal_conviction_entries": [],
    "candidate_civil_judgement_entries": [
      {
        "id": 143,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "00908-2009-0-1308-JP-FC-03",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA",
        "jne_id": 130592,
        "created_at": "2021-01-18T22:21:38.937Z",
        "updated_at": "2021-01-18T22:21:38.950Z"
      },
      {
        "id": 144,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "00910-2009-0-1308-JP-FC-03",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA",
        "jne_id": 130593,
        "created_at": "2021-01-18T22:21:38.992Z",
        "updated_at": "2021-01-18T22:21:39.003Z"
      },
      {
        "id": 145,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "00909-2009-0-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA",
        "jne_id": 130594,
        "created_at": "2021-01-18T22:21:39.058Z",
        "updated_at": "2021-01-18T22:21:39.080Z"
      },
      {
        "id": 146,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-25-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA",
        "jne_id": 130595,
        "created_at": "2021-01-18T22:21:39.148Z",
        "updated_at": "2021-01-18T22:21:39.163Z"
      },
      {
        "id": 147,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-90-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA",
        "jne_id": 130596,
        "created_at": "2021-01-18T22:21:39.231Z",
        "updated_at": "2021-01-18T22:21:39.283Z"
      },
      {
        "id": 148,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "01701-2012-0-1308-JR-CI-03",
        "court": "JUZGADO DE TRABAJO - SEDE CENTRAL",
        "sentence": "SIN SENTENCIA",
        "jne_id": 130597,
        "created_at": "2021-01-18T22:21:39.393Z",
        "updated_at": "2021-01-18T22:21:39.439Z"
      },
      {
        "id": 149,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-0-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA",
        "jne_id": 130599,
        "created_at": "2021-01-18T22:21:39.580Z",
        "updated_at": "2021-01-18T22:21:39.647Z"
      },
      {
        "id": 150,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-69-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA",
        "jne_id": 130600,
        "created_at": "2021-01-18T22:21:39.699Z",
        "updated_at": "2021-01-18T22:21:39.712Z"
      },
      {
        "id": 151,
        "candidate_id": 1874,
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-30-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA",
        "jne_id": 130601,
        "created_at": "2021-01-18T22:21:39.743Z",
        "updated_at": "2021-01-18T22:21:39.754Z"
      },
      {
        "id": 152,
        "candidate_id": 1874,
        "judgement_type": "FAMILIA / ALIMENTARIA",
        "record_id": "00826-2010-29-1308-JP-FC-03",
        "court": "1° JUZ. PAZ LETRADO DE FAMILIA- SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA /CONCILIACION",
        "jne_id": 130602,
        "created_at": "2021-01-18T22:21:39.781Z",
        "updated_at": "2021-01-18T22:21:39.806Z"
      },
      {
        "id": 153,
        "candidate_id": 1874,
        "judgement_type": "FAMILIA / ALIMENTARIA",
        "record_id": "00826-2010-0-1308-JP-FC-03",
        "court": "1° JUZ. PAZ LETRADO DE FAMILIA- SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA / CONCILIACION",
        "jne_id": 130603,
        "created_at": "2021-01-18T22:21:39.920Z",
        "updated_at": "2021-01-18T22:21:39.942Z"
      }
    ],
    "candidate_income_entries": [
      {
        "year": 2019,
        "income_type": "public_payroll_income",
        "amount": "0.0"
      },
      {
        "year": 2019,
        "income_type": "private_payroll_income",
        "amount": "112014.0"
      },
      {
        "year": 2019,
        "income_type": "public_contractor_income",
        "amount": "0.0"
      },
      {
        "year": 2019,
        "income_type": "private_contractor_income",
        "amount": "0.0"
      },
      {
        "year": 2019,
        "income_type": "public_other_income",
        "amount": "0.0"
      },
      {
        "year": 2019,
        "income_type": "private_other_income",
        "amount": "0.0"
      }
    ],
    "candidate_property_entries": [
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 04 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 11 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 19 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "TERRENO",
        "value": "40000.0",
        "address": "AVENIDA LOS ANGELES S/N - AYARPONGO PACHANGARA - OYON - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 06 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 13 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COCHERA",
        "value": "70000.0",
        "address": "CALLE FERNANDO VICTOR EUGENE DELACROIX NUM 161 ESTAC DOBLE N8 - SEMISÓTANO URB SAN BORJA  SEXTA ETAPA SAN BORJA LIMA LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 02 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 09 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 17 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "TERRENO",
        "value": "18112.5",
        "address": "MZ D LOTE 21 Y 36 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 07 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 14 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "DEPARTAMENTO",
        "value": "1260000.0",
        "address": "CALLE FERNANDO VICTOR EUGENE DELACROIX NUM 167 DPTO N402 - CUARTO PISO Y AZOTEA URB SAN BORJA - SEXTA ETAPA SAN BORJA - LIMA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 03 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 10 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 18 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 05 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 12 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 20 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "TERRENO",
        "value": "40000.0",
        "address": "AVENIDA LOS ANGELES S/N PACHANGARA - OYON - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 01 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 08 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 15 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "COLEGIO",
        "value": "72600.0",
        "address": "MZ D LOTE 16 BARRANCA - BARRANCA - LIMA",
        "description": null
      },
      {
        "property_type": "real_estate",
        "registry_type": "TERRENO",
        "value": "100000.0",
        "address": "AV. LARCO HERRERA N 349 PACHANGARA-OYON- LIMA",
        "description": null
      },
      {
        "property_type": "vehicle",
        "registry_type": "CAMIONETA",
        "value": "43490.0",
        "address": null,
        "description": "TOYOTA HILUX 2018 PLATA METALICO"
      },
      {
        "property_type": "vehicle",
        "registry_type": "CAMIONETA",
        "value": "105094.0",
        "address": null,
        "description": "MITSUBISHI PICKAT COLOR NEGRO"
      }
    ]
  }
]
```

#### Search params:

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
