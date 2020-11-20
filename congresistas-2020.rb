require "cgi"
require "json"
require "http"
require "active_support/inflector"

codigos = ["Zk2S7uS8rvQ%3d","bpzQiAWy%2fdc%3d","hZnu%2bV8rX7k%3d","srmnJ85M7o8%3d","%2fiG4Gn0A5oE%3d","mu6bNwYfvjM%3d","0QU0xWgltTY%3d","nhJ9ZJcBdMY%3d","D596D8iStOE%3d","djnJehpykio%3d","b%2f74gZ1Lf1k%3d","ME73C3irrbI%3d","0k4cml4OG%2bE%3d","06Fupr6SqYw%3d","K%2fvOpFCpc2o%3d","IUoNrt0llmQ%3d","%2f7KjDWDTXuc%3d","X3AHnxmKrJA%3d","XREVDo042qI%3d","14QAeNFBHK4%3d","E8m%2busAJRRc%3d","eujycp7kF8c%3d","%2btKl4FgIVUk%3d","%2bXmdSeCpOzQ%3d","ebVNRBaOY1w%3d","4xeDVJ9BcaM%3d","G6%2f6Cx1jh4s%3d","Kb%2brX9TiKbI%3d","CPO8I0BJl%2bY%3d","jzMrdHhM3ms%3d","ERO4mJAmi2s%3d","%2fTNaWjyy294%3d","1Vz1%2fdT%2f6wE%3d","v4hizg5oeBI%3d","D%2bpeD0epTbM%3d","C48imlFxuB0%3d","vxYZ8EeSiQ0%3d","9sa0JAeNeY0%3d","BfyIMMER35M%3d","EapnL2o2qM4%3d","CPcBgezVsAM%3d","UYwTUbrQctg%3d","rRRlAVAgXv0%3d","G7%2byNT%2bVOlA%3d","%2bJC8Od9T9ZE%3d","h1xjglkCy7g%3d","Ae5lj7LSCFY%3d","4WZm80TDLWU%3d","uIKADUgjYYI%3d","t5re7nVDKNs%3d","RDnBVmlyFDM%3d","Z4gZ3Aom4c4%3d","YW9L6w%2bquBA%3d","2l7CGsNVUuA%3d","6hNHXaZxxLQ%3d","NjImMw35xdw%3d","Jz7eTNMbxSw%3d","Q6s4IUTnYsU%3d","h3xa645TKOM%3d","LwdyeS8m8SA%3d","bNTy0c8jRhY%3d","ZZz9t1IDcTY%3d","Hn3UXD6ZFhY%3d","NBtrXYqqpsg%3d","kxBRCd0riVI%3d","EdXw0nK4hwA%3d","e8fblJl4%2bKo%3d","nLzDX%2b1HPtg%3d","cIw2ifRfy1s%3d","nqUtSetxGfA%3d","ekZ5m%2bCvEHs%3d","e2tcZTrna9A%3d","aGNsnu2v7DE%3d","0SImAFl843w%3d","HpdEwqKmLBM%3d","Cc0PTg7zZBI%3d","%2b%2bAQsPpeoYY%3d","CdN5akaQHRs%3d","erhkTXBpzf8%3d","gKh0qYsJv78%3d","ckWJmJ4W01E%3d","ZlTZuYCXxdg%3d","jPfeFgidufo%3d","WcRgWgxC7Ks%3d","DYqoSnJZBfY%3d","e6Vb5%2frAu88%3d","VSx%2bBnpeQ8g%3d","QEJS5d85rEg%3d","zrzOjps94mg%3d","SNoYcYD7Bz8%3d","5h2LGVRpe0s%3d","HHlHmf8JZNk%3d","O8vLt5atq30%3d","KHVfY3oylws%3d","Qk8QM02M9uo%3d","jLYDuCuGpeo%3d","OmGaCc5Sf%2fg%3d","gmfNvFtMbQw%3d","AuQH86BjqSg%3d","gotFnXf3uHI%3d","BOFp1arT39E%3d","03oLWeFqOxc%3d","umrVTX%2fYrPc%3d","65q4dr5WSYI%3d","Cqc71jSRWmA%3d","B6BnBQn3x8k%3d","igkhOtaCGOg%3d","de1a4Ng1AL0%3d","hYl2j6IhEMQ%3d","Wkxih2zK6eU%3d","RlkHXTAxGzA%3d","pYKcRo6W26c%3d","pmcxER8ruZk%3d","zcAo%2fiVkexQ%3d","kqirxBvDbXk%3d","JfrljxfhI3Y%3d","bhAvmmDeNrI%3d","efho%2fL4uVgE%3d","L8IR8a3V2xg%3d","%2blU5RRWviyA%3d","mLiJCZjQQ%2bU%3d","rK5nzuVE%2bUA%3d","ERKu6aK5HCA%3d","cV9eoJnuB18%3d","L1UGuqgVe6w%3d","h7oH9ZX2XLk%3d","RhDgAb1i65o%3d","NOlGTQ%2fLymg%3d","zSti9BOe%2bVU%3d","DWCap%2bvA4Z0%3d"]

congresistas = []

codigos.each do |codigo|

  response = JSON.parse(HTTP.get("https://votoinformado.jne.gob.pe/voto/HojaVida/CargarHojaVida?TxCodigo=#{CGI.escape(codigo)}").body.to_s)

  data = response["data"]["Data"]

  congresista = {
    foto: data["TXRUTAARCHIVO"],
    id_hoja_vida: data["IDHOJAVIDA"],
    documento_identidad: data["TXDOCUMENTOIDENTIDAD"],
    apellido_paterno: data["TXAPELLIDOPATERNO"],
    apellido_materno: data["TXAPELLIDOMATERNO"],
    nombres: data["TXNOMBRES"],
    organizacion_politica: data["TXORGANIZACIONPOLITICA"],
    cargo_electo: data["TXCARGOELECCION"],
    distrito_postulacion: data["TXPOSTULADISTRITO"],
    educacion: {
      basica: data["EDUCACIONBASICAS"][0]["TXTIENEBASICA"] == "SI",
      primaria: data["EDUCACIONBASICAS"][0]["TXTIENEPRIMARIA"] == "SI",
      primaria_completa: data["EDUCACIONBASICAS"][0]["TXCONCLUYOPRIMARIA"] == "SI",
      secundaria: data["EDUCACIONBASICAS"][0]["TXTIENESECUNDARIA"] == "SI",
      secundaria_completa: data["EDUCACIONBASICAS"][0]["TXCONCLUYOSECUNDARIA"] == "SI",
      universitaria: data["EDUCACIONUNIVERSITARIAS"].filter{ |educacion_universitaria| educacion_universitaria["FGTENGOEDUUNIVERSITARIA"] == 1 }.map do |educacion_universitaria|
        {
          universidad: educacion_universitaria["TXUNIVERSIDAD"],
          carrera: educacion_universitaria["TXCARRERAUNI"],
          bachiller: educacion_universitaria["TXBACHILLER"] == "SI",
          concluida: educacion_universitaria["TXCONCLUYO"] == "SI",
          titulo: educacion_universitaria["TXTITULO"] == "SI",
        }
      end,
      postgrados: data["EDUCACIONPOSTGRADOS"].filter{ |postgrado| postgrado["FGTENGOPOSGRADO"] == 1 }.map do |postgrado|
        {
          centro_estudios: postgrado["TXCENESTUDIOPOSGRADO"],
          especialidad: postgrado["TXESPECIALIDADPOSGRADO"],
          grado: postgrado["TXGRADO"],
          concluida: postgrado["TXCONCLUYO"] == "SI",
          egresado: postgrado["TXEGRESADO"] == "SI",
        }
      end,
    },
    experiencia_laboral: data["EXPERIENCIAS"].map do |experiencia|
      {
        centro_laboral: experiencia["TXCENTROTRABAJO"],
        ocupacion: experiencia["TXOCUPACIONPROFESION"],
        desde: experiencia["TXANIOTRABAJODESDE"],
        hasta: experiencia["TXANIOTRABAJOHASTA"],
      }
    end,
    cargos_electos: data["CARGOELECCIONS"].filter{ |cargo| cargo["FGCARGOELECCION"] == 1 }.map do |cargo|
      {
        organizacion_politica: cargo["TXORGPOLCARGOELEC"],
        cargo: cargo["TXCARGOELECCION2"],
        desde: cargo["TXANIOCARGOELECDESDE"],
        hasta: cargo["TXANIOCARGOELECHASTA"],
      }
    end,
    cargos_partidarios: data["CARGOPARTIDARIOS"].filter{ |cargo| cargo["FGTENGOCARGOPARTIDARIO"] == 1 }.map do |cargo|
      {
        organizacion_politica: cargo["TXORGPOLCARGOPARTIDARIO"],
        cargo: cargo["TXCARGOPARTIDARIO"],
        desde: cargo["TXANIOCARGOPARTIDESDE"],
        hasta: cargo["TXANIOCARGOPARTIHASTA"],
      }
    end,
    renuncias: data["RENUNCIAS"].filter{ |renuncia| renuncia["FGTENGORENUNCIAOP"] == 1 }.map do |renuncia|
      {
        organizacion_politica: renuncia["TXORGPOLRENUNCIAOP"],
        anio: renuncia["TXANIORENUNCIAOP"],
      }
    end,
    sentencias: {
      penales: data["SENTENCIAPENALS"].filter{ |sentencia| sentencia["FGTENGOSENTENCIAPENAL"] == 1 }.map do |sentencia|
        {
          delito: sentencia["TXDELITOPENAL"],
          organo_judicial: sentencia["TXORGANOJUDIPENAL"],
          fallo: sentencia["TXFALLOPENAL"],
          modalidad: sentencia["TXMODALIDAD"],
          cumplio_fallo: sentencia["TXCUMPLEFALLO"],
        }
      end,
      civiles: data["SENTENCIACIVILS"].filter{ |sentencia| sentencia["FGTENGOSENTENCIAOBLIGA"] == 1 }.map do |sentencia|
        {
          materia: sentencia["TXMATERIASENTENCIA"],
          fallo: sentencia["TXFALLOOBLIGA"]
        }
      end
    },
    ingresos: data["INGRESOS"].filter{ |ingreso| ingreso["FGTENGOINGRESOS"] == 1 }.map do |ingreso|
      {
        remuneracion_bruta_anual: {
          publico: ingreso["FLREMUBRUTAPUBLICO"],
          privado: ingreso["FLREMUBRUTAPRIVADO"],
          total: ingreso["TOTALREMBRUTA"],
        },
        renta_bruta_anual_ejercicio_individual: {
          publico: ingreso["FLRENTAINDIVIDUALPUBLICO"],
          privado: ingreso["FLRENTAINDIVIDUALPRIVADO"],
          total: ingreso["TOTALRENTA"],
        },
        otros_ingresos: {
          publico: ingreso["FLOTROINGRESOPUBLICO"],
          privado: ingreso["FLOTROINGRESOPRIVADO"],
          total: ingreso["TOTALOTRO"],
        },
      }
    end,
    inmuebles: data["BIENINMUEBLES"].filter{ |inmueble| inmueble["FGTENGOINMUEBLE"] == 1 }.map do |inmueble|
      {
        tipo: inmueble["TXTIPOBIENINMUEBLE"],
        sunarp: inmueble["TXPARTIDASUNARP"],
        autovaluo: inmueble["FLAUTOVALUO"]
      }
    end,
    muebles: data["BIENMUEBLES"].filter{ |inmueble| inmueble["FGTENGOBIENMUEBLE"] == 1 }.map do |mueble|
      {
        vehiculo: mueble["TXVEHICULO"],
        placa: mueble["TXPLACA"],
        valor: mueble["FLVALOR"]
      }
    end,
    otros: data["BIENOTROS"].map do |otro|
      {
        nombre: otro["TXOTROBIEN"],
        descripcion: otro["TXDESCRIPCION"],
        valor: otro["FLVALOR"]
      }
    end,
    contraloria: data["CONTRALORIA"].map do |contraloria|
      {
        sancion: contraloria["TXSANCION"],
        cargo: contraloria["TXCARGO"],
        entidad: contraloria["TXENTIDAD"],
        plazo: contraloria["TXPLAZO"],
        desde: contraloria["FechaInicio"],
        hasta: contraloria["FechaFin"],
      }
    end,
    trayectoria: data["TRAYECTORIA"].map do |trayectoria|
      {
        dni: trayectoria["TXDNI"],
        eleccion: trayectoria["TXELECCION"],
        lugar: trayectoria["TXLUGAR"],
        cargo: trayectoria["TXCARGO"],
        organizacion_politica: trayectoria["TXORGANIZACIONPOLITICA"],
        cargo_electo: trayectoria["TXCARGOELECTO"],
      }
    end
  }

  identificador = [congresista[:apellido_paterno], congresista[:apellido_materno], congresista[:nombres]].map(&:parameterize).join("-")

  filename = "#{identificador}.json"

  file = File.open("./data/congresistas-2020/#{filename}", "w")
  file.write(congresista.to_json)

  congresistas << congresista.slice(:foto, :apellido_paterno, :apellido_materno, :nombres, :organizacion_politica, :distrito_postulacion).merge(identificador: identificador)
end

file = File.open("./data/congresistas-2020.json", "w")
file.write(congresistas.to_json)