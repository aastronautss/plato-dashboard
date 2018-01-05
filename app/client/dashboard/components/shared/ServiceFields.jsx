import React from 'react';
import humanizeSnakeCaseString from '../../modules/humanizeSnakeCaseString';

class ServiceFields extends React.Component {
  inputForProperty(name) {
    const propertyOpts = this.props.schema[name];
    const fieldType = this.fieldForProperty(propertyOpts);
    const required = this.isRequiredField(name);

    const humanizedName = humanizeSnakeCaseString(name);

    return (
      <div key={name}>
        <label>
          {humanizedName}
          <input type={fieldType} name={name} required={this.isRequiredField(name)}/>
        </label>
      </div>
    );
  }

  fieldForProperty(propertyOpts) {
    return 'text';
  }

  isRequiredField(name) {
    const requireds = this.props.schema.required;

    if (requireds) {
      return requireds.some(requiredName => requiredName === name);
    } else {
      return false;
    }
  }

  render () {
    const names = Object.entries(this.props.schema).map(pair => pair[0]);
    const inputs = names.map(this.inputForProperty.bind(this));

    return <div>{inputs}</div>;
  }
}

export default ServiceFields;
