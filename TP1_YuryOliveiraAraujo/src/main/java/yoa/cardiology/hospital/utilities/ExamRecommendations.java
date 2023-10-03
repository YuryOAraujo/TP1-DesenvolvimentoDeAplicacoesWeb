package yoa.cardiology.hospital.utilities;

public enum ExamRecommendations {
	ECG_RECOMMENDATIONS("Recomendações para Eletrocardiograma (ECG):",
			"1. Vestimenta Adequada: Use uma roupa que permita fácil acesso ao peito.",
			"2. Evitar Café e Cafeína: Evite alimentos e bebidas ricos em cafeína antes do exame.",
			"3. Jejum Não é Necessário: Não é necessário fazer jejum antes do ECG.",
			"4. Remover Joias e Objetos Metálicos: Retire joias e objetos metálicos que possam interferir com os eletrodos.",
			"5. Medicamentos: Informe seu médico sobre todos os medicamentos que está tomando."),

	ECHO_RECOMMENDATIONS("Recomendações para Ecocardiograma (Ecocardiograma):",
			"1. Jejum Não é Necessário: Não é necessário fazer jejum antes do ecocardiograma.",
			"2. Vestimenta Adequada: Vista-se confortavelmente para permitir fácil acesso ao peito.",
			"3. Evitar Café e Cafeína: Evite alimentos e bebidas ricos em cafeína antes do exame.",
			"4. Medicamentos: Informe seu médico sobre todos os medicamentos que está tomando.",
			"5. Chegar com Antecedência: Chegue à clínica com tempo suficiente antes do exame.");

	private final String title;
	private final String[] recommendations;

	ExamRecommendations(String title, String... recommendations) {
		this.title = title;
		this.recommendations = recommendations;
	}

	public String getTitle() {
		return title;
	}

	public String[] getRecommendations() {
		return recommendations;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(title).append("\n");
		for (String recommendation : recommendations) {
			sb.append("\t").append(recommendation).append("\n");
		}
		return sb.toString();
	}
}
