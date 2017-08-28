module CatsHelper

  def sex(gender)
    if gender == 1
      "男"
    else
      "女"
    end
  end


  def is_neuter?(neuter)
    if neuter
      "是"
    else
      "否"
    end
  end

  def is_vaccine?(vaccine)
    if vaccine
      "是"
    else
      "否"
    end
    
  end
end

