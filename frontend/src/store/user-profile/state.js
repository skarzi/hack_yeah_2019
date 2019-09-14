export default {
  username: 'Łukasz',
  /*
   * Event's objects has following properties:
   * + datetime - datetime of QR code scan
   * + amount - number of cigarette butt collected
   * + location - location name
   */
  events: [
    {
      amount: 4,
      datetime: new Date(2019, 9, 14, 21, 21, 21),
      location: 'Hack Yeah'
    },
    {
      amount: 5,
      datetime: new Date(2019, 9, 14, 20, 52, 46),
      location: 'Hack Yeah'
    },
    {
      amount: 1,
      datetime: new Date(2019, 9, 14, 20, 33, 1),
      location: 'Hack Yeah'
    },
    {
      amount: 2,
      datetime: new Date(2019, 9, 14, 19, 33, 17),
      location: 'Hack Yeah'
    },
    {
      amount: 1,
      datetime: new Date(2019, 9, 14, 19, 23, 37),
      location: 'Hack Yeah'
    },
    {
      amount: 3,
      datetime: new Date(2019, 9, 14, 19, 19, 37),
      location: 'Hack Yeah'
    },
    {
      amount: 1,
      datetime: new Date(2019, 9, 14, 19, 0, 13),
      location: 'Hack Yeah'
    }
  ]
}
