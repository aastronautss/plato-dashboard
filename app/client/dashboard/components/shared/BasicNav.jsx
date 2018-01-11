import React from 'react';

class BasicNav extends React.Component {
  render() {
    const keys = Object.entries(this.props.views).map(pair => pair[0]);
    const links = keys.map((key) => {
      return (
        <a
          className="btn btn-default"
          key={key}
          href={`#${key}`}
          onClick={this.props.onClick}
        >
          {this.props.views[key].title}
        </a>
      );
    });

    return (
      <nav className="widget-nav">
        <div className="btn-group">
          {links}
        </div>
      </nav>
    );
  }
}

export default BasicNav;
