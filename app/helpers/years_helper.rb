module YearsHelper
  def add_link_to_for_admin(value)
    if policy(@years).new?
      link_to value, yield, class: 'btn btn-success'
    else
      value
    end
  end
end
