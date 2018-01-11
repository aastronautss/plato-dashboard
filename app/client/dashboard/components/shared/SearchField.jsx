import React from 'react';

class SearchField extends React.Component {
  render() {
    const placeholderText = `Find an ${this.props.type}...`;

    return (
        <form
          className="form-inline"
          onSubmit={this.props.onSubmit}
          onChange={this.props.onChange}
        >
          <div className="input-group">
            <input className="form-control" type="text" name="q" placeholder={placeholderText} />
            <span className="input-group-btn">
              <input className="btn btn-default" type="submit" value="Search" />
            </span>
          </div>
        </form>
    );
  }
}

export default SearchField;
