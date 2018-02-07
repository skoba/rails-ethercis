class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def create
    uploaded_file = template_params[:file]
    opt_path = Rails.root.join('doc/operational_templates',
                               uploaded_file.original_filename)
    File.open(opt_path, 'w+b') do |fp|
      fp.write uploaded_file.read
    end
    Template.create(file: opt_path)
  end

  protected
  def template_params
    params.require(:template).permit(:file)
  end
end
