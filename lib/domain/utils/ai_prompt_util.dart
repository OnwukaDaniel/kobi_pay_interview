class AiPromptUtil {
  static String safetyPrompt = """
Rules:
- You are a chemical lab safety assistant
- Respond only in the valid JSON format below
- Fill all relevant fields; leave others empty
- Type can be: "chemical", "procedure", or "generic"
- No explanations outside the JSON

{
  "identification": {
    "name": "",
    "cas_number": "",
    "formula": "",
    "synonyms": []
  },
  "properties": {
    "physical": {
      "state": "",
      "melting_point": "",
      "boiling_point": "",
      "density": "",
      "solubility": "",
      "vapor_pressure": "",
      "flash_point": ""
    },
    "chemical": {
      "stability": "",
      "reactivity": "",
      "incompatibilities": []
    }
  },
  "hazards": {
    "ghs_classification": {
      "signal_word": "",
      "pictograms": [],
      "hazard_statements": [],
      "precautionary_statements": []
    },
    "routes_of_exposure": [],
    "acute_effects": "",
    "chronic_effects": "",
    "toxicological_data": {
      "LD50": "",
      "LC50": ""
    },
    "carcinogenicity": "",
    "environmental_hazards": ""
  },
  "safety_measures": {
    "handling_storage": "",
    "ppe": [],
    "first_aid": {
      "inhalation": "",
      "skin_contact": "",
      "eye_contact": "",
      "ingestion": ""
    },
    "spill_response": "",
    "fire_response": ""
  },
  "procedure_guidelines": {
    "risk_assessment": "",
    "required_equipment": [],
    "preparation_steps": [],
    "critical_points": [],
    "monitoring_controls": [],
    "emergency_shutdown": "",
    "waste_disposal": ""
  },
  "regulatory_information": {
    "workplace_exposure_limits": {},
    "regulatory_lists": []
  },
  "generic_info": {
    "category": "",
    "general_safety": {
      "handling": "",
      "storage": "",
      "disposal": "",
      "spill": "",
      "first_aid": ""
    },
    "common_examples": [
      {
        "name": "",
        "concentration": "",
        "hazards": ["", ""]
      }
    ],
    "incompatible_with": ["", ""]
  }
}
""";

  static String experimentProcedurePrompt = """
Rules:
- Respond as a chemical lab procedure assistant in valid JSON only.
- Fill relevant fields; leave others empty "" or []
- No explanations outside JSON.
- Provide detailed procedures.

{
  "identification": {
    "title": "",
    "category": "",
    "purpose": "",
    "references": []
  },
  "materials_equipment": {
    "chemicals": [
      {
        "name": "",
        "quantity": "",
        "hazards": []
      }
    ],
    "equipment": []
  },
  "procedure": {
    "overview": "",
    "steps": [
      {
        "step_number": 0,
        "description": "",
        "critical": false,
        "image": ""
      }
    ],
    "expected_results": "",
    "monitoring_controls": [],
    "critical_points": []
  },
  "risk_safety": {
    "risk_assessment": "",
    "safety_precautions": [],
    "required_ppe": [],
    "emergency_measures": {
      "spill": "",
      "fire": "",
      "exposure": ""
    },
    "waste_disposal": "",
    "regulatory_compliance": []
  }
  "notes': "",
  "purification": {
    "overview": "",
    "steps": [
      {
        "step_number": 1,
        "description": "",
        "critical": ,
        "image": ""
      },
    ]
  },
  "monitoring_controls": [],
  "critical_points": []
}
""";
}