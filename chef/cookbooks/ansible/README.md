# chef-ansible

This is a chef cookbook that allows install of ansible, download of playbooks, and specification of the variables to use for the run.

## Supported Platforms

Ubuntu Based Systems

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ansible']['vars']</tt></td>
    <td>Hash</td>
    <td>Hash of variables to include in the Ansible run passed to Chef using .to_json and included as a file</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['ansible']['inventory']['host_group']</tt></td>
    <td>String</td>
    <td>Host group name used to construct the inventory for the local run.  Includes localhost</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['ansible']['playbook']</tt></td>
    <td>String</td>
    <td>Name of the playbook to run using ansible-playbook</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['ansible']['playbook_archive']</tt></td>
    <td>String</td>
    <td>Filename of the playbook tar archive to download from S3</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['ansible']['bucket']</tt></td>
    <td>String</td>
    <td>Name of the bucket to download the playbook from</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['ansible']['path']</tt></td>
    <td>String</td>
    <td>Path or prefix where the playbook archive is located in S3</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['ansible']['aws_access_key']</tt></td>
    <td>String</td>
    <td>Access key to use when downloading from S3</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['ansible']['aws_Secret_key']</tt></td>
    <td>String</td>
    <td>Secret key to use when downloading from S3</td>
    <td><tt>false</tt></td>
  </tr>
</table>

## Example Usage

    node['ansible']['vars']['myvar'] = 'myvalue'
    node['ansible']['inventory']['host_group'] = 'magicalhosts'
    node['ansible']['playbook'] = 'neat_playbook.yml'
    node['ansible']['playbook_archive'] = 'neat_playbook_0.0.1.tar.gz'
    node['ansible']['bucket'] = 'mybucket'
    node['ansible']['path'] = '/ansible-playbooks'

### ansible::default

Include `ansible` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[ansible::default]"
  ]
}
```

## License and Authors

Author:: Ryan O'Keeffe
