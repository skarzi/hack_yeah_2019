export function events (state) {
  return state.events.slice(0, 10)
}

export function totalCigaretteButtsNumber (state) {
  return state.events.map((item) => item.amount).reduce((x, y) => x + y, 0)
}
