<?php 
defined('BASEPATH') OR exit('No direct script access allowed');


defined('BASEPATH') OR exit('No direct script access allowed');

class M_user extends CI_Model 
{
    
    public function __construct()
    {
        parent::__construct();
    }
    
    private $_table = "tb_user";

    public $id_user;
    public $nama_user;
    public $email;
    public $sandi;

    public function rules()
    {
        return [
            ['field' => 'nama_user',
            'label'=> 'Nama User',
            'rules'=> 'required'],
            
            ['field' => 'sandi',
            'label' => 'Sandi',
            'rules' => 'required'],

            ['field' => 'email',
            'label' => 'Email',
            'rules' => 'required']
        ];
    }
    
    function getRows($params = array())
    {
        $this->db->select('*');
        $this->db->from($this->userTbl);

        // mengumpuklkan data dengan kondisi
        if (array_key_exists("conditions", $params)) {
            foreach ($params['conditions'] as $key => $value) {
                $this->db->where($key, $value);
            }
        }

        if (array_key_exists("id", $params)) {
            foreach ($params['id'] as $params['id']) {
                $this->db->where('id', $params['id']);
                $query = $this->db->get();
                $result = $query->row_array();
            }
        } else {
            //set start and limit
            if (array_key_exists('start', $params) && array_key_exists('limit', $params)) {
                $this->db->limit($params['limit'], $params['start']);
            }elseif (!array_key_exists('start', $params) && array_key_exists('limit', $params)) {
                $this->db->limit($params['limit']);
            }
            $query = $this->db->get();

            if (array_key_exists('returnType', $params) && $params['returnType'] == 'count') {
                $result = $query->num_rows();
            }elseif (array_key_exists('returnType', $params) && $params['returnType'] == 'single') {
                $result = ($query->num_rows() > 0)?$query->row_array():FALSE;
            }else {
                $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
            }  
        }

        //return fetch data
        return $result;
    }

    public function getAll()
    {
        return $this->db->get($this->_table)->result();
    }

    public function getById($id)
    {
        return $this->db->get_where($this->_table, ["id_user" => $id])->row();
    }

    public function save()
    {
        $post = $this->input->post();
        $this->id_user = uniqid();
        $this->nama_user = $post['nama_user'];
        $this->email = $post['email'];
        $this->sandi = $post['sandi'];
        $this->db->insert($this->_table, $this);
    }

    public function update()
    {
        $post = $this->input->post();
        $this->id_user = $post['id'];
        $this->nama_user = $post['nama_user'];
        $this->email = $post['email'];
        $this->sandi = $post['sandi'] ;
        $this->db->update($this->_table, $this, array('id_user' => $post['id']));
    }

    public function delete($id)
    {
        return $this->db->delete($this->_table, array("id_user" => $id));
    }


    

}

/* End of file M_user.php */


/* End of file Modal_user.php */
 ?>