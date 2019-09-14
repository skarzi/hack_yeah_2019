export function addEvent (state, event) {
  state.events = [event, ...state.events]
}
