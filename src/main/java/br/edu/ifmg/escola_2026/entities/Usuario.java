package br.edu.ifmg.escola_2026.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.extern.java.Log;

import java.time.Instant;
import java.util.Collection;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Getter
@Setter
@ToString
@EqualsAndHashCode(onlyExplicitlyIncluded = true)

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor

@Log

@Entity
@Table(name = "usuario")
public class Usuario {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NonNull
    private String nome;
    private String telefone;
    private String email;
    private String senha;

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant criadoEm;
    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant atualizadoEm;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "tb_usuario_role",
            joinColumns = @JoinColumn(name = "id_usuario"),
            inverseJoinColumns = @JoinColumn(name = "id_perfil")
    )

    private Set<Role> perfis = new HashSet<Role>();

    public void addRole(Role perfil){
        this.perfis.add(perfil);
    }

    public boolean hasRole(Role perfil){
        return this.perfis.contains(perfil);
    }

    @PrePersist
    public void prePersist(){
        this.criadoEm = Instant.now();
    }

    @PreUpdate
    public void preUpdate(){
        this.atualizadoEm = Instant.now();
    }



    /*@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return perfis;
    }

   @Override
    public String getPassword() {
        return senha;
    }

    @Override
    public String getUsername() {
        return email;
    }*/
}
