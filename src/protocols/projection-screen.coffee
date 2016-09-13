module.exports = (helper) ->
  return protocolInfo = {

    name: 'projection-screen'
    type: 'command'
    commands: ["up", "down", "stop"]
    values:
      command:
        type: "string"
    brands: ["IDontKnow"]
    pulseLengths: [196, 600, 5228]
    pulseCounts: [132]

    decodePulses: (pulses) ->
      
      switch pulses
        when "110011001010110100101100101101010100110101010011001100101010110100101010101010110010101010101010101010101100110100101101001011010102" then command = "down"
        when "110011001010110100101100101101010100110101010011001100101010110100101010101010110010101010101010101011001011001010110010110100101102" then command = "up"
        when "110011001010110100101100101101010100110101010011001100101010110100101010101010110010101010101010101011001010110100110010110011010102" then command = "stop"
        else command = "Pulse not recognized"
        
      return result = {
        command: command
      }

    encodeMessage: (message) ->

      header = '11001100101011010010110010110101010011010101001100110010101011010010101010101011001010101010101010'

      if message.command then switch message.command
        when "down" then commandcode = "10101011001101001011010010110101"
        when "up"   then commandcode = "10110010110010101100101101001011"
        when "stop" then commandcode = "10110010101101001100101100110101"
      
      footer = '02'
 
      return "#{header}#{commandcode}#{footer}"
  }