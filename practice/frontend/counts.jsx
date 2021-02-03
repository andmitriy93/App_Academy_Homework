import React from "react";

class Counts extends React.Component {
  componentWillMount() { debugger }
  componentDidMount() { debugger }
  componentWillReceiveProps(nextProps) { debugger }
  componentWillUpdate(nextProps, nextState) { debugger }
  componentDidUpdate(prevProps, prevState) { debugger }
  compmonentWillUnmount() { debugger }

  render() {
    return (
      <ul>
        {this.props.previousCounts.map((count) => (
          <li>{count}</li>
        ))}
      </ul>
    );
  }
}

// const Counts = ({ previousCounts }) => (
//   <ul>
//     {previousCounts.map((count, idx) => (
//       <li key={idx}>{count}</li>
//     ))}
//   </ul>
// );

export default Counts;
