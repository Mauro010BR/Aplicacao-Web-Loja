
package model;


public class Cadastro {

    private int id;
    private String email;
    private String nome;
    private String data;
    private String sexo;
    private String senha;
    private String perfil;

    public Cadastro() {

    }

    public Cadastro(String email, String nome, String data, String sexo, String senha) {
        this.email = email;
        this.nome = nome;
        this.data = data;
        this.sexo = sexo;
        this.senha = senha;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setData(String data) {
        this.data = data;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getNome() {
        return nome;
    }

    public String getData() {
        return data;
    }

    public String getSexo() {
        return sexo;
    }

    public String getSenha() {
        return senha;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

}
