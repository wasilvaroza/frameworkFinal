class EventosReport < Prawn::Document
    def initialize(eventos)
        super()
        @eventos = eventos
        text_content
        table_content
    end
    def text_content
        y_position = cursor - 50
        bounding_box([0, y_position], :width => 540, :height => 50) do
            text "Listagem de Eventos", size: 12, style: :bold
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
        [['Nome','Local','Assunto','Inicio']] +
        @eventos.map do |evento|
            [evento.titulo,evento.local,evento.assunto,evento.dataHora_inicio]
        end
    end
end