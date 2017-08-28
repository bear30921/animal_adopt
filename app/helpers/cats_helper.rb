module CatsHelper

  def sex(gender)
    if gender == 1
      "男"
    else
      "女"
    end
  end

  def type(current_type)
    if current_type == 1
      "貓"
    else
      "狗"
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

  def city(current_city)
    case current_city
    when 1
      "基隆"
    when 2
      "台北"
    when 3
      "新北"
    when 4
      "桃園"
    when 5
      "新竹"
    when 6
      "苗栗"
    when 7
      "台中"
    when 8
      "彰化"
    when 9
      "南投"
    when 10
      "雲林"
    when 11
      "嘉義"
    when 12
      "台南"
    when 13
      "高雄"
    when 14
      "屏東"
    when 15
      "宜蘭"
    when 16
      "台東"
    when 17
      "澎湖"
    else
      "其他"
    end
  end
end

