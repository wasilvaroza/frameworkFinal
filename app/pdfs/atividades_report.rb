class AtividadesReport < Prawn::Document
    def initialize(atividades)
        super()
        @atividades = atividades
        text_content
        table_content
    end
    def text_content
        y_position = cursor - 50
        bounding_box([0, y_position], :width => 540, :height => 50) do
            text "Listagem de Atividades", size: 12, style: :bold
        end
    end
    def table_content
        table atividade_rows do
            row(0).font_style = :bold
            self.header = true
            self.row_colors = ['DDDDDD', 'FFFFFF']
            self.column_widths = [90,200, 200, 50]
        end
    end
    def atividade_rows
        [['Atividade','Evento','Início','Fim']] +
        @atividades.map do |atividade|
            [atividade.tituloatividade,atividade.evento.titulo,atividade.dataHora_inicio,atividade.dataHora_fim]
        end
    end
end