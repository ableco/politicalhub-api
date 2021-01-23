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
    "mothers_maiden_name": "GARCIA MILLA",
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
        "political_organization": "PARTIDO DEMOCRATICO SOMOS PERU",
        "office": "REGIDOR PROVINCIAL",
        "start_year": null,
        "end_year": null,
        "comments": ""
      },
      {
        "political_organization": "CONCERTACION PARA EL DESARROLLO REGIONAL - LIMA",
        "office": "CONSEJERO REGIONAL",
        "start_year": null,
        "end_year": null,
        "comments": ""
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
        "judgement_type": "LABORAL",
        "record_id": "00908-2009-0-1308-JP-FC-03",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "00910-2009-0-1308-JP-FC-03",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "00909-2009-0-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-25-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-90-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "01701-2012-0-1308-JR-CI-03",
        "court": "JUZGADO DE TRABAJO - SEDE CENTRAL",
        "sentence": "SIN SENTENCIA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-0-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-69-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA"
      },
      {
        "judgement_type": "LABORAL",
        "record_id": "01061-2008-30-1308-JP-FC-02",
        "court": "JUZ. DE PAZ LETRADO LABORAL - SEDE PAZ LETRADO",
        "sentence": "FUNDADA LA DEMANDA"
      },
      {
        "judgement_type": "FAMILIA / ALIMENTARIA",
        "record_id": "00826-2010-29-1308-JP-FC-03",
        "court": "1° JUZ. PAZ LETRADO DE FAMILIA- SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA /CONCILIACION"
      },
      {
        "judgement_type": "FAMILIA / ALIMENTARIA",
        "record_id": "00826-2010-0-1308-JP-FC-03",
        "court": "1° JUZ. PAZ LETRADO DE FAMILIA- SEDE PAZ LETRADO",
        "sentence": "SIN SENTENCIA / CONCILIACION"
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

#### Fields

| Field | Description |
|-------|-------------|
| `id` | Internal ID for candidate's record. |
| `residence_ubigeo` | UBIGEO code of the candidate's residence. |
| `postulation_ubigeo` | UBIGEO code of the department the candidate is running for. |
| `political_organization_id` | Internal ID for the political organization the candidate is running for. |
| `office` | The office the candidate is running for (eg: Presidency, Vice-presidency, Congress, etc) |
| `secondary_office` | Another office the candidate is running for (eg: vice-presidency candidates also can run for Congress). |
| `candidate_education_entries` | `primary` (Primaria), `secondary` (Secundaria), `technical_studies` (Educación técnica) or `training` (Educación no universitaria). |
| `candidate_university_education_entries` | University education. |
| `candidate_graduate_education_entries` | Postgraduate education (Postgrado). |
| `candidate_work_experience_entries` | Work experience. |
| `candidate_political_party_office_entries` | Positions inside a political organization. |
| `candidate_previous_elected_office_entries` | History of elections the candidate won. |
| `candidate_political_organization_resignation_entries` | History of political organizations the candidate resigned from. |
| [`candidate_criminal_conviction_entries`](#candidate_criminal_conviction_entries) | History of criminal convictions (Sentencias penales). |
| [`candidate_civil_judgement_entries`](#candidate_civil_judgement_entries) | History of civil judgments (Sentencias civiles). |
| [`candidate_income_entries`](#candidate_income_entries) | Detail of candidates income. |
| [`candidate_property_entries`](#candidate_property_entries) | List of properties (real estate and vehicles). |

##### `candidate_criminal_conviction_entries`

| Field | Description (in Spanish) |
|-------|--------------------------|
| `record_id` | (Nº expediente) |
| `date` | (Fecha de sentencia) |
| `court` | (Juzgado) |
| `crime` | (Delito) |
| `sentence` | (Sentencia) |
| `sentence_type` | (Modalida de la sentencia) |
| `status` | (Pena cumplida o no) |

##### `candidate_civil_judgement_entries`

| Field | Description (in Spanish) |
|-------|--------------------------|
| `judgement_type` | (Materia de la sentencia) |
| `record_id` | (Nº expediente) |
| `court` | (Juzgado) |
| `sentence` | (Sentencia) |

##### `candidate_income_entries`

###### `income_type`

| Value | Description (in Spanish) |
|-------|--------------------------|
| `public_payroll_income` | (Planillas en el sector público) |
| `private_payroll_income` | (Planillas en el sector privado) |
| `public_contractor_income` | (Ejercicio individual en el sector público) |
| `private_contractor_income` | (Ejercicio individual en el sector privado) |
| `public_other_income` | (Otros ingresos en el sector público) |
| `private_other_income` | (Otros ingresos en el sector privado) |

##### `candidate_property_entries`

| Field | Description |
|-------|--------------------------|
| `property_type` | `real_estate` or `vehicle` |

#### Search params:

| Param | Description | Sample value |
|-------|-------------|---------------|
| `electoral_process` | The JNE ID for the electoral process the candidates are participating at. | `110` (default) |
| `political_organization`| The internal ID for the political organization the candidates belong to. You can get them from `http://politicalhub-api.herokuapp.com/political_organizations`. | `2` |
| `ubigeo` | The UBIGEO code related to the electoral department the candidates are running for. Check [Ubigeos](#ubigeos). | `140100` |
| `office` | The ID for the office the candidates are running for. `1` for presidential candidates and `4` for Congress candidates. | `1` |
| `with_sentences` | Filter candidates with sentences (both criminal and civil) | `true` |
| `has_individual_financial_contributions` | Filter candidates that made financial contributions to political organizations | `true` |
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
