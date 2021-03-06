module.exports = function(helper) {
  var binaryToPulse, protocolInfo, pulsesToBinaryMapping;
  pulsesToBinaryMapping = {
    '10': '1',
    '01': '0',
    '02': ''
  };
  binaryToPulse = {
    '0': '10',
    '1': '01'
  };
  return protocolInfo = {
    name: 'contact4',
    type: 'contact',
    values: {
      id: {
        type: 'number'
      },
      contact: {
        type: 'boolean'
      }
    },
    brands: ['GS-IWDS07'],
    pulseLengths: [468, 1364, 14096],
    pulseCount: 50,
    decodePulses: function(pulses) {
      var binary, result;
      binary = helper.map(pulses, pulsesToBinaryMapping);
      return result = {
        id: helper.binaryToNumber(binary, 0, 19),
        contact: helper.binaryToBoolean(binary, 21)
      };
    }
  };
};
