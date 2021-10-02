--in1     = trigger/clock input
--in2     = v8 input
--outs1&3 = trigger outputs for voices 1&2
--outs2&4 = v8 outputs for voices 1&2

function init()
  input[1]{ mode      = 'change'
          , direction = 'rising'
          }
  input[2]{ mode = 'stream'
          , time = 0.001
          }
end

input[1].change = function(r)
  r = math.random() * 0.1 - 0.05
    if r >= 0 then
      output[1](pulse())
    elseif r <= 0 then
      output[3](pulse())
  end
end

input[2].stream = function(v)
  output[2].volts = v
  output[4].volts = v
end
