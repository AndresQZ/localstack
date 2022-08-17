exports.handler = function(event, context, callback) {
    console.log("EVENT: \n" + JSON.stringify(event, null, 2))
    return context
}
