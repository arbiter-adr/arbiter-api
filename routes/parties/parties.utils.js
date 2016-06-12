exports.new = (party) => {
  return new Promise((resolve, reject) => {
    console.log(JSON.parse(party));
    resolve(JSON.parse(party));
  })
}
