import React from 'react';

import ArtistSearchResult from './ArtistSearchResult';

class ArtistSearchResults extends React.Component {
  render() {
    const items = this.props.results.map((result) => {
      return (
        <ArtistSearchResult
          key={result.artist.id}
          result={result}

          onAdd={this.props.onAdd}
          onRemove={this.props.onRemove}
          onPause={this.props.onPause}
          onUnpause={this.props.onUnpause}
        />
      );
    });

    return (
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Score</th>
            <th></th>
          </tr>
        </thead>

        <tbody>{items}</tbody>
      </table>
    );
  }
}

export default ArtistSearchResults;
