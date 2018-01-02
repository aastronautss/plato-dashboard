import React from 'react';

class SearchField extends React.Component {
  render() {
    const placeholderText = `Find an ${this.props.type}...`;

    return (
      <form onSubmit={this.props.onSubmit} onChange={this.props.onChange}>
        <input type="text" name="q" placeholder={placeholderText} />
        <input type="submit" value="Search" />
      </form>
    );
  }
}

export default SearchField;
