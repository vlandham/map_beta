
root = exports ? this

PropertyData = () ->
  data = null
  all = null
  dimensions = {}
  op_expense = 0.2
  cap_rate = 0.08
  # all_rents = []

  filterData = {
    "building_rsf":
      min:3000
      max:4500000
      values:[3000,4500000]
      # ticks:[3000,8000,13000,20500,30500,46500,65000,100000,150000,280000,4500000]
      # ticks:[3000, 4810, 5997, 7014, 8000, 9055, 10137, 11413, 12705, 14306, 16198, 18271, 20328, 22632, 25000, 28129, 30381, 33717, 37192, 41752, 46256, 50466, 55000, 59931, 64653, 72326, 80000, 89619, 100000, 108927, 121503, 135530, 152252, 175375, 202942, 235050, 279112, 335695, 422507, 578662, 4500000]
      ticks:[3000, 4820, 6000, 7030, 8000, 9090, 10150, 11430, 12740, 14320, 16200, 18300, 20350, 22670, 25000, 28140, 30380, 33710, 37180, 41720, 46260, 50400, 55000, 59850, 64490, 72270, 80000, 89530, 99920, 108700, 121250, 135420, 151930, 175110, 202880, 235000, 278810, 333360, 421160, 572470, 4500000]
      prefix:""
      suffix:""
    "government_leased":
      min:0
      max:100
      values:[0,100]
      # ticks:[0,10,20,30,40,50,60,70,80,90,100]
      ticks:[0, 2.5, 5, 7.5, 10, 12.5, 15, 17.5, 20, 22.5, 25, 27.5, 30, 32.5, 35, 37.5, 40, 42.5, 45, 47.5, 50, 52.5, 55, 57.5, 60, 62.5, 65, 67.5, 70, 72.5, 75, 77.5, 80, 82.5, 85, 87.5, 90, 92.5, 95, 97.5, 100]
      prefix:""
      suffix:"%"
    "government_rsf":
      min:3000
      max:2400000
      values:[3000,2400000]
      # ticks:[3000,4500,6000,7500,9500,12000,16000,23000,38000,78000,2400000]
      # ticks:[3000, 3381, 3749, 4077, 4420, 4841, 5161, 5569, 5992, 6340, 6811, 7220, 7609, 8050, 8552, 9068, 9600, 10086, 10722, 11479, 12116, 12977, 13975, 14957, 16232, 17654, 19214, 21063, 23162, 25648, 29336, 33291, 38000, 45386, 53043, 63920, 78018, 99155, 134027, 217171, 2386940]
      ticks:[3000, 3380, 3750, 4080, 4440, 4850, 5170, 5590, 6000, 6350, 6810, 7220, 7630, 8050, 8560, 9090, 9600, 10100, 10770, 11500, 12160, 12990, 14000, 14970, 16240, 17700, 19250, 21100, 23200, 25740, 29560, 33320, 38130, 45560, 53110, 64040, 78200, 99200, 134260, 217420, 2400000]
      prefix:""
      suffix:""
    "remaining_total_term":
      min:0
      max:20
      values:[0,20]
      # ticks:[0,2,4,6,8,10,12,14,16,18,20]
      ticks:[0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 14.5, 15, 15.5, 16, 16.5, 17, 17.5, 18, 18.5, 19, 19.5, 20]
      prefix:""
      suffix:""
    "remaining_firm_term":
      min:0
      max:20
      values:[0,20]
      # ticks:[0,2,4,6,8,10,12,14,16,18,20]
      ticks:[0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 14.5, 15, 15.5, 16, 16.5, 17, 17.5, 18, 18.5, 19, 19.5, 20]
      prefix:""
      suffix:""
    "total_rent":
      min:0
      max:71500000
      values:[0,71500000]
      # ticks:[0,700000,1400000, 2100000, 2800000, 3500000, 4200000, 4900000, 5600000, 6300000, 7400000, 71511980]
      # ticks:[0, 53708, 67858, 78443, 88442, 97116, 105644, 113907, 123562, 132434, 144852, 154784, 168900, 180573, 192898, 206924, 221634, 238924, 255005, 273329, 297825, 318896, 344745, 373107, 405162, 439359, 482688, 527748, 585045, 651704, 732091, 832861, 977582, 1166531, 1410049, 1709484, 2127426, 2608457, 3389545, 6295542, 71511980]
      ticks:[0, 53690, 67740, 78390, 88300, 97050, 105530, 113830, 123480, 132240, 144560, 154590, 168750, 180050, 192630, 206180, 221160, 238130, 254620, 272200, 297490, 318000, 342890, 371210, 403260, 437950, 479430, 525080, 581990, 649160, 729410, 829540, 975030, 1161940, 1409830, 1710560, 2127740, 2611850, 3392270, 6305710, 71500000]
      prefix:"$"
      suffix:""
    "rent_prsf":
      min:0
      max:90
      values:[0,90]
      # ticks:[0,25,50,75,100,125,150,175,200,225,250]
      # ticks:[0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 96, 102, 108, 114, 120, 126, 132, 138, 144, 150, 156, 162, 168, 174, 180, 186, 192, 198, 204, 210, 216, 222, 230, 240, 250]
      ticks:[0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 65, 66, 68, 72, 74, 78, 82, 86, 90]
      prefix:""
      suffix:""
  }

  clean = (rawData) ->
    fields = [
      "bldg_rsf"
      "percent_govt_leased"
      "total_leased_rsf"
      "remaining_total_term"
      "remaining_firm_term"
      "total_annual_rent"
      "rent_prsf"
    ]
    rawData.forEach (d) ->
      fields.forEach (f) ->
        d[f] = parseFloat(d[f])
    rawData

  stats = (data) ->
    fields = [
      "bldg_rsf"
      "percent_govt_leased"
      "total_leased_rsf"
      "remaining_total_term"
      "remaining_firm_term"
      "total_annual_rent"
      "rent_prsf"
    ]

    fields.forEach (field) ->
      ext = d3.extent(data, (d) -> d[field])
      console.log("#{field}: #{ext[0]} - #{ext[1]}")
      nums = data.map (d) -> d[field]
      # console.log(nums)
      nums.sort( d3.ascending)
      quants = []
      for x in [0..40] by 1
        val = x / 40.0
        quants.push val
      # [0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0].forEach (i) ->
      vals = []
      quants.forEach (i) ->
        q = Math.round(d3.quantile(nums,i) /10) * 10
        vals.push q
      console.log(vals)

    data

  pdata = (rawData) ->
    # vals = []
    # for x in [0..90] by 2
    #   vals.push x
    # console.log(vals)
    # console.log(vals.length)
    rawData = clean(rawData)
    # rawData = stats(rawData)
    data = crossfilter(rawData)
    all = data.groupAll()
    setupDimensions()
    # setupSliders()
    setupRangedSliders()

  setupRangedSliders = () ->
    d3.entries(filterData).forEach (entry) ->
      sliderId = "#slider_#{entry.key}"
      selectClass = "select_#{entry.key}"
      selecter = d3.select(sliderId)
        .append("select")
        .attr("class", selectClass)
        .style("display", "none")
      selecter.selectAll("option")
        .data(entry.value.ticks)
        .enter().append("option")
        .attr("value", (d) -> d)
        .attr("selected", (d) -> if entry.value.values[0] == d then "selected" else null)
        .text((d) -> entry.value.prefix + fixUp(d) + entry.value.suffix)

      selecter = d3.select(sliderId)
        .append("select")
        .attr("class", selectClass)
        .style("display", "none")
      selecter.selectAll("option")
        .data(entry.value.ticks)
        .enter().append("option")
        .attr("value", (d) -> d)
        .attr("selected", (d) -> if entry.value.values[1] == d then "selected" else null)
        .text((d) -> d)

      $(".#{selectClass}").selectToUISlider({
        labels:0
        callback:'custom_slide'
      })
    $(root).bind('custom_slide', handleSlide)

  setupSliders = () ->
    d3.entries(filterData).forEach (entry) ->
      sliderId = "#slider_#{entry.key}"
      $(sliderId).slider({
        range:true,
        min:entry.value.min,
        max:entry.value.max,
        values: entry.value.values
        slide: handleSlide
      })

  handleSlide = (event, sliderId, values) ->
    sliderId = sliderId.replace("slider_","")
    min = parseFloat(values[0]) - 1
    max = parseFloat(values[1]) + 1
    dimensions[sliderId].filter([min,max])
    # console.log("#{sliderId}:  #{min} - #{max}")
    $(root).trigger('filterupdate')

  setupDimensions = () ->
    dimensions.building_rsf = data.dimension (d) -> d.bldg_rsf
    dimensions.government_leased = data.dimension (d) -> parseFloat(d.percent_govt_leased)
    dimensions.government_rsf = data.dimension (d) -> d.total_leased_rsf
    dimensions.remaining_total_term = data.dimension (d) -> d.remaining_total_term
    dimensions.remaining_firm_term = data.dimension (d) -> d.remaining_firm_term
    dimensions.total_rent = data.dimension (d) -> d.total_annual_rent
    dimensions.rent_prsf = data.dimension (d) -> d.rent_prsf

    # all_rents = dimensions.total_rent.top(Infinity).map((d) -> d.total_annual_rent).reverse()

    d3.entries(filterData).forEach (entry) ->
      min = entry.value.values[0] - 1
      max = entry.value.values[1] + 1
      dimensions[entry.key].filter([min,max])

  pdata.data = () ->
    if dimensions.building_rsf
      dimensions.building_rsf.top(Infinity)
    else
      []

  pdata.capRate = (_) ->
    if !arguments.length
      return cap_rate
    cap_rate = _
    pdata

  pdata.opExpense = (_) ->
    if !arguments.length
      return op_expense
    op_expense = _
    pdata

  pdata.total_rsf = () ->
    if all
      all.reduceSum((d) -> d.total_leased_rsf).value()
    else
      0

  calculate_cap = (rent) ->
        noi = rent - (rent * op_expense)
        noi / cap_rate

  # pdata.cap_value_extent = () ->
  #   [calculate_cap(all_rents[0]), calculate_cap(all_rents[all_rents.length - 1])]


  pdata.total_cap_value = () ->
    if all
      all.reduceSum((d) ->
        calculate_cap(d.total_annual_rent)
      ).value()
    else
      0

  pdata


USMap = () ->
  width = 620
  height = 430
  data = null
  dimensions = null
  filters = null
  circles = null
  circle = []
  states = null
  labels = null
  projection = null
  projection = d3.geo.albersUsa()
  path = d3.geo.path()

  tooltip = null


  circleRadius = 4

  usmap = (selection) ->
    tooltip = CustomTooltip("map_tooltip", 240)
    selection.each (rawData) ->
      data = rawData

      projection.scale(width * 1.2)
        .translate([10, 0])

      path.projection(projection)

      svg = d3.select(this).selectAll("svg").data([data])
      gEnter = svg.enter().append("svg").append("g")
      svg.attr("width", width)
      svg.attr("height", height)

      svg.append("rect")
        .attr("class", "background")
        .attr("width", width)
        .attr("height", height)

      g = svg.insert("g")
        .attr("transform", "translate(#{width / 2},#{height / 2})")

      states = g.append("g")
        .attr("id", "states")
        
      labels = g.append("g")
        .attr("id", "state-labels")

      circles = g.append("g")
        .attr("id", "circles")

      d3.json "data/us-states.json", render_states
      update()

  usmap.update = (newData) ->
    data = newData
    update()

  update = () ->
    positions = []
    data.forEach (d) ->
      location = [d.longitude, d.latitude]
      positions.push(projection(location))

    circle = circles.selectAll("circle")
      .data(data, (d) -> "#{d.longitude},#{d.latitude}")

    circle.enter().append("circle")
      .attr("class", "location")
      .attr("cx", (d,i) -> positions[i][0])
      .attr("cy", (d,i) -> positions[i][1])
      .attr("r", circleRadius)
      .on("mouseover", (d,i) -> show_details(d,i,this))
      .on("mouseout", (d,i) -> hide_details(d,i,this))

    circle.exit().remove()

  show_details = (data, i, element) =>
    d3.select(element).classed("active", true)
    content = "<p class=\"main\">#{data.city}, #{data.state}</p><hr class=\"tooltip-hr\">"
    content +="<span class=\"name\">Lease RSF:</span><span class=\"value\"> #{fixUp(data.total_leased_rsf)}</span><br/>"
    content +="<span class=\"name\">% Govt Leased:</span><span class=\"value\"> #{fixUp(data.percent_govt_leased)}%</span><br/>"
    content +="<span class=\"name\">Rent/RSF:</span><span class=\"value\"> #{fixUp(data.rent_prsf)}</span><br/>"
    content +="<span class=\"name\">Remaining Term (Yrs):</span><span class=\"value\"> #{fixUp(data.remaining_total_term)}</span><br/>"
    tooltip.showTooltip(content,d3.event)

  hide_details = (data, i, element) =>
    d3.select(element).classed("active", false)
    tooltip.hideTooltip()


  render_states = (states_json) ->
    states.selectAll("path")
      .data(states_json.features)
      .enter().append("path")
      .attr("d", path)

  usmap

root.plotData = (selector, data, plot) ->
  d3.select(selector)
    .datum(data)
    .call(plot)


$ ->

  my_map = USMap()
  my_data = PropertyData()

  root.update = () ->
    filteredData = my_data.data()
    $("#metric_locations").text(addCommas(filteredData.length))
    $("#metric_rsf").text(fixUp(my_data.total_rsf()))
    root.updateCap()
    my_map.update(filteredData)

  root.updateCap = () ->
    $("#metric_cap_value").text("$"+fixUp(my_data.total_cap_value()))
    # cap_extent = my_data.cap_value_extent()
    # $("#label_cap_value_start").text("$"+fixUp(cap_extent[0]))
    # $("#label_cap_value_end").text("$"+fixUp(cap_extent[1]))

  $(root).bind('filterupdate', update)

  plotData("#map",[], my_map)

  # $(".slider").slider({
  #   range:true,
  #   min:0,
  #   max:500,
  #   values: [75, 300]
  # })
  # $(".mini_slider").slider()
  setOpExpense = (event, parentID, values) ->
    my_data.opExpense(values[0])
    root.updateCap()

  setCapRate = (event, parentID, values) ->
    my_data.capRate(values[0])
    root.updateCap()

  $("#select_op_expense").selectToUISlider({
    labels:0
    callback:'set_op_expense'
    every:1
  })
  $(root).bind('set_op_expense', setOpExpense)

  $("#select_cap_rate").selectToUISlider({
    labels:0
    callback:'set_cap_rate'
    every:1
  })
  $(root).bind('set_cap_rate', setCapRate)


  $(".icon-question-sign").tipsy({gravity:'s'})


  display = (data) ->
    my_data(data)
    update()

  d3.csv("data/property_data.csv", display)

