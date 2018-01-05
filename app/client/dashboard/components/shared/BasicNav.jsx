import React from 'react';

class BasicNav extends React.Component {
  render() {
    const keys = Object.entries(this.props.views).map(pair => pair[0]);
    const links = keys.map((key) => {
      return (
        <li key={key}>
          <a href={`#${key}`} onClick={this.props.onClick}>{this.props.views[key].title}</a>
        </li>
      );
    });

    return (
      <nav>
        <ul>{links}</ul>
      </nav>
    );
  }
}

export default BasicNav;
