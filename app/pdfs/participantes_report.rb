class ParticipantesReport < Prawn::Document
    def initialize(participantes)
        super()
        @participantes = participantes
        text_content
        table_content
    end
    def text_content
        y_position = cursor - 50
        bounding_box([0, y_position], :width => 540, :height => 50) do
            text "Listagem de Participantes", size: 12, style: :bold
        end
    end
    def table_content
        table evento_rows do
            row(0).font_style = :bold
            self.header = true
            self.row_colors = ['DDDDDD', 'FFFFFF']
            self.column_widths = [90,200, 200, 50]
        end
    end
    def evento_rows
        [['Nome','RG','Email','Formação']] +
        @participantes.map do |participante|
            [participante.nome,participante.rg,participante.email,participante.formacao]
        end
    end
end