class Scrapers::CandidateScraper
  class << self
    def call(electoral_process_id: 110, election_type_id: 2, ubigeo: "")
      electoral_process = ElectoralProcess.find_by(jne_id: electoral_process_id)

      registration_requests = registration_requests_by_electoral_process(
        electoral_process_id: electoral_process_id,
        election_type_id: election_type_id,
        ubigeo: ubigeo
      )

      registration_requests.each do |registration_request|
        political_organization = PoliticalOrganization.find_by(slug: registration_request[:political_organization].parameterize)
        political_organization&.update(jne_id: registration_request[:political_organization_id])

        candidates = candidates_by_registration_request(
          registration_request_id: registration_request[:registration_request_id],
          file_id: registration_request[:file_id],
          electoral_process_id: electoral_process_id,
          election_type_id: election_type_id
        )

        candidates.each do |candidate_from_registration_request|
          resume = candidate_resume(
            electoral_process_id: electoral_process_id,
            resume_id: candidate_from_registration_request[:resume_id],
            political_organization_id: registration_request[:political_organization_id]
          )

          next if resume.nil?

          personal_information = resume[:personal_information]
          primary_education = resume[:primary_education]
          secondary_education = resume[:secondary_education]
          technical_studies = resume[:technical_studies]
          training = resume[:training]
          university_studies = resume[:university_studies]
          graduate_studies = resume[:graduate_studies]
          work_experience = resume[:work_experience]
          political_party_offices = resume[:political_party_offices]
          previous_elected_offices = resume[:previous_elected_offices]
          political_organization_resignations = resume[:political_organization_resignations]
          criminal_convictions = resume[:criminal_convictions]
          civil_judgements = resume[:civil_judgements]
          incomes = resume[:incomes]
          real_estate = resume[:real_estate]
          vehicles = resume[:vehicles]

          person = Person.find_or_create_by(identification_number: personal_information[:identification_number])
          person.update(
            family_name: personal_information[:family_name],
            mothers_maiden_name: personal_information[:mothers_maiden_name],
            names: personal_information[:names],
            date_of_birth: personal_information[:date_of_birth],
            country_of_birth: personal_information[:country_of_birth],
            gender: personal_information[:gender],
            profile_photo: person.profile_photo || personal_information[:profile_photo]
          )

          candidate = Candidate.find_or_create_by(
            person_id: person.id,
            electoral_process_id: electoral_process.id,
            political_organization_id: political_organization.id,
            office_id: personal_information[:office_id],
            jne_id: personal_information[:jne_id]
          )
          candidate.update(
            designated: candidate_from_registration_request[:designated],
            number: candidate_from_registration_request[:number],
            residence_ubigeo: personal_information[:residence_ubigeo],
            residence_region: personal_information[:residence_region],
            residence_province: personal_information[:residence_province],
            residence_district: personal_information[:residence_district],
            postulation_ubigeo: personal_information[:postulation_ubigeo],
            secondary_office_id: personal_information[:secondary_office_id]
          )

          if primary_education
            candidate_primary_education_entry = CandidateEducationEntry.find_or_create_by(
              candidate_id: candidate.id,
              education_type: :primary,
              jne_id: primary_education[:jne_id]
            )
            candidate_primary_education_entry.update(primary_education)
          end

          if secondary_education
            candidate_secondary_education_entry = CandidateEducationEntry.find_or_create_by(
              candidate_id: candidate.id,
              education_type: :secondary,
              jne_id: secondary_education[:jne_id]
            )
            candidate_secondary_education_entry.update(secondary_education)
          end

          if technical_studies
            candidate_technical_studies_entry = CandidateEducationEntry.find_or_create_by(
              candidate_id: candidate.id,
              education_type: :technical_studies,
              jne_id: technical_studies[:jne_id]
            )
            candidate_technical_studies_entry.update(technical_studies)
          end

          if training
            candidate_training_entry = CandidateEducationEntry.find_or_create_by(
              candidate_id: candidate.id,
              education_type: :training,
              jne_id: training[:jne_id]
            )
            candidate_training_entry.update(training)
          end

          university_studies.each do |university_studies_entry|
            candidate_university_studies_entry = CandidateUniversityEducationEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: university_studies_entry[:jne_id]
            )
            candidate_university_studies_entry.update(university_studies_entry)
          end

          if graduate_studies
            candidate_graduate_studies_entry = CandidateGraduateEducationEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: graduate_studies[:jne_id]
            )
            candidate_graduate_studies_entry.update(graduate_studies)
          end

          work_experience.each do |work_experience_entry|
            candidate_work_experience_entry = CandidateWorkExperienceEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: work_experience_entry[:jne_id]
            )
            candidate_work_experience_entry.update(work_experience_entry)
          end

          political_party_offices.each do |political_party_office_entry|
            candidate_political_party_office_entry = CandidatePoliticalPartyOfficeEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: political_party_office_entry[:jne_id]
            )
            candidate_political_party_office_entry.update(political_party_office_entry)
          end

          previous_elected_offices.each do |previous_elected_office_entry|
            candidate_previous_elected_office_entry = CandidatePreviousElectedOfficeEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: previous_elected_office_entry[:jne_id]
            )
            candidate_previous_elected_office_entry.update(previous_elected_office_entry)
          end

          political_organization_resignations.each do |political_organization_resignation_entry|
            candidate_political_organization_resignation_entry = CandidatePoliticalOrganizationResignationEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: political_organization_resignation_entry[:jne_id]
            )
            candidate_political_organization_resignation_entry.update(political_organization_resignation_entry)
          end

          criminal_convictions.each do |criminal_conviction_entry|
            candidate_criminal_conviction_entry = CandidateCriminalConvictionEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: criminal_conviction_entry[:jne_id]
            )
            candidate_criminal_conviction_entry.update(criminal_conviction_entry)
          end

          civil_judgements.each do |civil_judgement_entry|
            candidate_civil_judgement_entry = CandidateCivilJudgementEntry.find_or_create_by(
              candidate_id: candidate.id,
              jne_id: civil_judgement_entry[:jne_id]
            )
            candidate_civil_judgement_entry.update(civil_judgement_entry)
          end

          incomes.each do |income_entry|
            candidate_income_entry = CandidateIncomeEntry.find_or_create_by(
              candidate_id: candidate.id,
              year: income_entry[:year],
              income_type: income_entry[:income_type],
              jne_id: income_entry[:jne_id]
            )

            candidate_income_entry.update(income_entry)
          end

          real_estate.each do |real_estate_entry|
            candidate_real_estate_entry = CandidatePropertyEntry.find_or_create_by(
              candidate_id: candidate.id,
              property_type: :real_estate,
              jne_id: real_estate_entry[:jne_id]
            )
            candidate_real_estate_entry.update(real_estate_entry)
          end

          vehicles.each do |vehicle_entry|
            candidate_vehicle_entry = CandidatePropertyEntry.find_or_create_by(
              candidate_id: candidate.id,
              property_type: :vehicle,
              jne_id: vehicle_entry[:jne_id]
            )
            candidate_vehicle_entry.update(vehicle_entry)
          end
        end

        sleep 5
      end
    end

    def registration_requests_by_electoral_process(electoral_process_id: 110, election_type_id: 2, ubigeo: "")
      url = "https://plataformaelectoral.jne.gob.pe/Candidato/GetExpedientesLista/#{electoral_process_id}-#{election_type_id}-#{ubigeo}------0-"
      request = HTTP.follow.get(url)

      JSON.parse(request.body.to_s).fetch("data").map do |registration_request|
        {
          registration_request_id: registration_request["idSolicitudLista"],
          file_id: registration_request["idExpediente"],
          political_organization: registration_request["strOrganizacionPolitica"],
          political_organization_id: registration_request["idOrganizacionPolitica"],
          state: registration_request["strEstadoLista"],
          electoral_district: registration_request["strDistritoElec"]
        }
      end
    end

    def candidates_by_registration_request(registration_request_id:, file_id:, election_type_id: 2, electoral_process_id: 110)
      url = "https://plataformaelectoral.jne.gob.pe/Candidato/GetCandidatos/#{election_type_id}-#{electoral_process_id}-#{registration_request_id}-#{file_id}"
      puts "Fetching: #{url}"
      request = HTTP.follow.get(url)

      JSON.parse(request.body.to_s).fetch("data").map do |candidate|
        {
          identification_number: candidate["strDocumentoIdentidad"],
          resume_id: candidate["idHojaVida"],
          office_id: candidate["idCargoEleccion"],
          number: candidate["intPosicion"],
          designated: candidate["strFGDesignado"] == "1",
          state: candidate["strEstadoExp"]
        }
      end
    end

    def candidate_resume(resume_id:, political_organization_id:, electoral_process_id: 110)
      url = "https://plataformaelectoral.jne.gob.pe/HojaVida/GetHVConsolidado?param=#{resume_id}-0-#{political_organization_id}-#{electoral_process_id}"
      puts "Fetching: #{url}"
      request = HTTP.follow.get(url)

      resume = JSON.parse(request.body.to_s).fetch("data")

      return nil if resume.nil?

      personal_information = {
        identification_number: resume["oDatosPersonales"]["strDocumentoIdentidad"],
        family_name: resume["oDatosPersonales"]["strApellidoPaterno"],
        mothers_maiden_name: resume["oDatosPersonales"]["strApellidoMaterno"],
        names: resume["oDatosPersonales"]["strNombres"],
        date_of_birth: parse_date(resume["oDatosPersonales"]["strFechaNacimiento"]),
        gender: parse_gender(resume["oDatosPersonales"]["strSexo"]),
        country_of_birth: resume["oDatosPersonales"]["strPaisNacimiento"],
        residence_ubigeo: resume["oDatosPersonales"]["strUbigeoDomicilio"],
        residence_region: resume["oDatosPersonales"]["strDomiDepartamento"],
        residence_province: resume["oDatosPersonales"]["strDomiProvincia"],
        residence_district: resume["oDatosPersonales"]["strDomiDistrito"],
        postulation_ubigeo: resume["oDatosPersonales"]["strUbigeoPostula"],
        profile_photo: resume["oDatosPersonales"]["strRutaArchivo"],
        office_id: resume["oDatosPersonales"]["idCargoEleccion"],
        secondary_office_id: resume["oDatosPersonales"]["idCargoEleccionOtro"],
        jne_id: resume["oDatosPersonales"]["idHojaVida"]
      }
      primary_education = nil
      secondary_education = nil
      technical_studies = nil
      training = nil
      graduate_studies = nil
      incomes = []

      if parse_flag(resume.dig("oEduBasica", "strEduPrimaria"))
        primary_education = {
          finished: parse_flag(resume["oEduBasica"]["strConcluidoEduPrimaria"]),
          jne_id: resume["oEduBasica"]["idHVEduBasica"]
        }
      end

      if parse_flag(resume.dig("oEduBasica", "strEduSecundaria"))
        secondary_education = {
          finished: parse_flag(resume["oEduBasica"]["strConcluidoEduSecundaria"]),
          jne_id: resume["oEduBasica"]["idHVEduBasica"]
        }
      end

      if parse_flag(resume.dig("oEduTecnico", "strTengoEduTecnico"))
        technical_studies = {
          center: resume["oEduTecnico"]["strCenEstudioTecnico"],
          career: resume["oEduTecnico"]["strCarreraTecnico"],
          finished: parse_flag(resume["oEduTecnico"]["strConcluidoEduTecnico"]),
          jne_id: resume["oEduTecnico"]["idHVEduTecnico"]
        }
      end

      if parse_flag(resume.dig("oEduNoUniversitaria", "strTengoNoUniversitaria"))
        training = {
          center: resume["oEduNoUniversitaria"]["strCentroEstudioNoUni"],
          career: resume["oEduNoUniversitaria"]["strCarreraNoUni"],
          finished: parse_flag(resume["oEduNoUniversitaria"]["strConcluidoNoUni"]),
          jne_id: resume["oEduNoUniversitaria"]["idHVNoUniversitaria"]
        }
      end

      university_studies = resume["lEduUniversitaria"].filter do |university_studies_entry|
        parse_flag(university_studies_entry["strTengoEduUniversitaria"])
      end.map do |university_studies_entry|
        {
          university: university_studies_entry["strUniversidad"],
          degree: university_studies_entry["strCarreraUni"],
          finished: parse_flag(university_studies_entry["strConcluidoEduUni"]),
          graduated: parse_flag(university_studies_entry["strEgresadoEduUni"]),
          degree_year: parse_year(university_studies_entry["strAnioBachiller"]),
          comments: university_studies_entry["strComentario"],
          jne_id: university_studies_entry["idHVEduUniversitaria"]
        }
      end

      if parse_flag(resume.dig("oEduPosgrago", "strTengoPosgrado"))
        graduate_studies = {
          grad_school: resume["oEduPosgrago"]["strCenEstudioPosgrado"],
          major: resume["oEduPosgrago"]["strEspecialidadPosgrado"],
          finished: parse_flag(resume["oEduPosgrago"]["strConcluidoPosgrado"]),
          graduated: parse_flag(resume["oEduPosgrago"]["strEgresadoPosgrado"]),
          degree_year: parse_year(resume["oEduPosgrago"]["strAnioPosgrado"]),
          master_degree: parse_flag(resume["oEduPosgrago"]["strEsMaestro"]),
          phd: parse_flag(resume["oEduPosgrago"]["strEsDoctor"]),
          comments: resume["oEduPosgrago"]["strComentario"],
          jne_id: resume["oEduPosgrago"]["idHVPosgrado"]
        }
      end

      work_experience = resume["lExperienciaLaboral"].filter do |work_experience_entry|
        parse_flag(work_experience_entry["strTengoExpeLaboral"])
      end.map do |work_experience_entry|
        {
          workplace: work_experience_entry["strCentroTrabajo"],
          profession: work_experience_entry["strOcupacionProfesion"],
          start_year: parse_year(work_experience_entry["strAnioTrabajoDesde"]),
          end_year: parse_year(work_experience_entry["strAnioTrabajoHasta"]),
          jne_id: work_experience_entry["idHVExpeLaboral"]
        }
      end

      political_party_offices = resume["lCargoPartidario"].filter do |political_party_office_entry|
        parse_flag(political_party_office_entry["strTengoCargoPartidario"])
      end.map do |political_party_office_entry|
        {
          political_organization_id: political_party_office_entry["idOrgPolCargoPartidario"],
          political_organization_name: political_party_office_entry["strOrgPolCargoPartidario"],
          office: political_party_office_entry["strCargoPartidario"],
          start_year: parse_year(political_party_office_entry["strAnioCargoPartiDesde"]),
          end_year: parse_year(political_party_office_entry["strAnioCargoPartiHasta"]),
          comments: political_party_office_entry["strComentario"],
          jne_id: political_party_office_entry["idHVCargoPartidario"]
        }
      end

      previous_elected_offices = resume["lCargoEleccion"].filter do |elected_office_entry|
        parse_flag(elected_office_entry["strCargoEleccion"])
      end.map do |elected_office_entry|
        {
          political_organization_id: elected_office_entry["idOrgPolCargoElec"],
          political_organization_name: elected_office_entry["strOrgPolCargoElec"],
          office_id: elected_office_entry["idCargoEleccion"],
          office: elected_office_entry["strCargoEleccion2"],
          start_year: parse_year(elected_office_entry["strAnioCargoElecDesde"]),
          end_year: parse_year(elected_office_entry["strAnioCargoElecHasta"]),
          comments: elected_office_entry["strComentario"],
          jne_id: elected_office_entry["idHVCargoEleccion"]
        }
      end

      political_organization_resignations = resume["lRenunciaOP"].filter do |resignation|
        parse_flag(resignation["strTengoRenunciaOP"])
      end.map do |resignation|
        {
          political_organization_id: resignation["idOrgPolRenunciaOP"],
          political_organization_name: resignation["strOrgPolRenunciaOP"],
          resignation_year: parse_year(resignation["strAnioRenunciaOP"]),
          comments: resignation["strComentario"],
          jne_id: resignation["idHVRenunciaOP"]
        }
      end

      criminal_convictions = resume["lSentenciaPenal"].filter do |sentence|
        parse_flag(sentence["strTengoSentenciaPenal"])
      end.map do |sentence|
        {
          record_id: sentence["strExpedientePenal"],
          date: parse_date(sentence["strFechaSentenciaPenal"]),
          court: sentence["strOrganoJudiPenal"],
          crime: sentence["strDelitoPenal"],
          sentence: sentence["strFalloPenal"],
          sentence_type: sentence["strModalidad"] == "OTRO" ? sentence["strOtraModalidad"] : sentence["strModalidad"],
          status: sentence["strCumpleFallo"],
          jne_id: sentence["idHVSentenciaPenal"]
        }
      end

      civil_judgements = resume["lSentenciaObliga"].filter do |sentence|
        parse_flag(sentence["strTengoSentenciaObliga"])
      end.map do |sentence|
        {
          judgement_type: sentence["strMateriaSentencia"],
          record_id: sentence["strExpedienteObliga"],
          court: sentence["strOrganoJuridicialObliga"],
          sentence: sentence["strFalloObliga"],
          jne_id: sentence["idHVSentenciaObliga"]
        }
      end

      if parse_flag(resume["oIngresos"]["strTengoIngresos"])
        year = parse_year(resume["oIngresos"]["strAnioIngresos"])
        jne_id = resume["oIngresos"]["idHVIngresos"]

        income_values = {
          public_payroll_income: resume["oIngresos"]["decRemuBrutaPublico"],
          private_payroll_income: resume["oIngresos"]["decRemuBrutaPrivado"],
          public_contractor_income: resume["oIngresos"]["decRentaIndividualPublico"],
          private_contractor_income: resume["oIngresos"]["decRentaIndividualPrivado"],
          public_other_income: resume["oIngresos"]["decOtroIngresoPublico"],
          private_other_income: resume["oIngresos"]["decOtroIngresoPrivado"]
        }

        incomes = income_values.map do |income_type, amount|
          {
            year: year,
            income_type: income_type,
            amount: amount,
            jne_id: jne_id
          }
        end
      end

      real_estate = resume["lBienInmueble"].filter do |property|
        parse_flag(property["strTengoInmueble"])
      end.map do |property|
        {
          registry_type: property["strTipoBienInmueble"],
          address: property["strInmuebleDireccion"],
          license_plate_or_public_record: property["strPartidaSunarp"],
          value: property["decAutovaluo"],
          comments: property["strComentario"],
          jne_id: property["idHVBienInmueble"]
        }
      end

      vehicles = resume["lBienMueble"].filter do |vehicle|
        parse_flag(vehicle["strTengoBienMueble"])
      end.map do |vehicle|
        {
          registry_type: vehicle["strVehiculo"],
          license_plate_or_public_record: vehicle["strPlaca"],
          value: vehicle["decValor"],
          description: vehicle["strCaracteristica"],
          comments: vehicle["strComentario"],
          jne_id: vehicle["idHVBienMueble"]
        }
      end

      {
        personal_information: personal_information,
        primary_education: primary_education,
        secondary_education: secondary_education,
        technical_studies: technical_studies,
        training: training,
        university_studies: university_studies,
        graduate_studies: graduate_studies,
        work_experience: work_experience,
        political_party_offices: political_party_offices,
        previous_elected_offices: previous_elected_offices,
        political_organization_resignations: political_organization_resignations,
        criminal_convictions: criminal_convictions,
        civil_judgements: civil_judgements,
        incomes: incomes,
        real_estate: real_estate,
        vehicles: vehicles
      }
    end

    private

    def parse_flag(flag)
      case flag
      when "0"
        nil
      when "1"
        true
      when "2"
        false
      end
    end

    def parse_gender(gender)
      case gender
      when "1"
        "m"
      when "2"
        "f"
      end
    end

    def parse_date(date)
      return nil if date.blank?

      Date.strptime(date, "%d/%m/%Y")
    end

    def parse_year(year)
      return nil if year.blank?
      return nil if year == "0000"

      year.to_i
    end
  end
end
