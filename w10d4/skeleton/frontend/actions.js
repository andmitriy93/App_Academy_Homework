const selectLocation = (city, job) => {
    return {
        type: "SWITCH_LOCATION",
        city,
        job,
    }
}


window.selectLocation = selectLocation;


export default selectLocation